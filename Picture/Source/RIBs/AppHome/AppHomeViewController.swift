//
//  AppHomeViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import RIBs
import RxSwift
import RxCocoa

import UIKit
import UIUtil
import RxUtil
import Then
import Reusable
import PinLayout
import RxRealmDataSources
import RealmSwift

//MARK: - Listener
protocol AppHomePresentableListener: AnyObject {
    func didTapAddBtn()
}

final class AppHomeViewController: BaseViewController, AppHomePresentable, AppHomeViewControllable {
    
    //MARK: - Properties
    weak var listener: AppHomePresentableListener?
    
    private let pageScrollView = PageScrollView(images: [
        UIImage(named: "PageImage1"),
        UIImage(named: "PageImage2"),
        UIImage(named: "PageImage3"),
        UIImage(named: "PageImage4")
    ])
    
    private let imagePicker = UIImagePickerController().then{
        $0.sourceType = .photoLibrary
        $0.allowsEditing = true
    }
    
    private let titleLabel = UILabel().then{
        $0.textColor = .black
        $0.alpha = 0.5
        $0.text = "전에 만든 사진"
        $0.numberOfLines = 0
        $0.font  = .systemFont(ofSize: 13)
    }
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        $0.showsHorizontalScrollIndicator = false
        $0.collectionViewLayout = layout
        $0.register(AppHomeCollectionViewCell.self, forCellWithReuseIdentifier: "AppHomeCell")
    }
    
    private let addBtn = AddBtn().then{
        $0.backgroundColor = .white
        $0.layer.applySketchShadow(color: .gray, alpha: 0.25, x: 0, y: 4, blur: 10, spread: 0)
        $0.layer.cornerRadius = 20
    }
    
    
    //MARK: - Main
    override func configureUI() {
        title = "Home"
        tabBarItem = UITabBarItem(title: "홈",
                                  image: UIImage(systemName: "house"),
                                  selectedImage: UIImage(systemName: "house.fill"))
        collectionView.contentInset = UIEdgeInsets(top: 0, left: bounds.width/20, bottom: 0, right: bounds.width/20)
    }
    
    override func addView() {
        view.addSubviews(pageScrollView,titleLabel,collectionView,addBtn)
    }
    
    override func setLayout() {
        pageScrollView.pin.top(self.view.pin.safeArea.top).right().left().height(bounds.height/2)
        titleLabel.pin.left(bounds.width/18.75).below(of: pageScrollView).width(100%).height(20)
        collectionView.pin.below(of: titleLabel).left().right().height(140)
        addBtn.pin.bottom(view.pin.safeArea.bottom + 20).right(20).size(50)
    }
    override func delegate() {
        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    //MARK: - Bind
    override func bindView() {
        addBtn.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.listener?.didTapAddBtn()
            })
            .disposed(by: disposeBag)
    }
    
    override func bindState() {
        let dataSource = RxCollectionViewRealmDataSource<Photo>(cellIdentifier: "AppHomeCell", cellType: AppHomeCollectionViewCell.self){ cell , indexPath, item in
            cell.label.text = Date().usingDate(time: item.date)
            cell.imageView.image = ImageDirectory.shared.loadImageFromDocumentDirecotry(imageName: "\(item.id).png")
        }
        let realm = try! Realm()
        let photoset = Observable.changeset(from: realm.objects(Photo.self)).share()
        photoset
            .bind(to: collectionView.rx.realmChanges(dataSource))
            .disposed(by: disposeBag)
    }
}

//MARK: - Page
extension AppHomeViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width/3.75 , height: bounds.width/3.75)
    }
}
