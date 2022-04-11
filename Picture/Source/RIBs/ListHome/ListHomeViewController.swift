//
//  ListHomeViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/17.
//

import RIBs
import RxSwift
import UIKit
import PinLayout
import RealmSwift
import RxRealm
import RxRealmDataSources

protocol ListHomePresentableListener: AnyObject {
    func didTapCollectionViewRequest(_ id : String)
}

final class ListHomeViewController: BaseViewController, ListHomePresentable, ListHomeViewControllable {
    
    //MARK: - Listener
    weak var listener: ListHomePresentableListener?
    
    private var deleteState : Bool = true
    
    //MARK: - Properties
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        let layout = UICollectionViewFlowLayout()
        $0.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: "List")
        $0.showsVerticalScrollIndicator = false
        $0.collectionViewLayout = layout
    }
    
    //MARK: - initalizer
    override func configureUI() {
        title = "List"
        tabBarItem = UITabBarItem(title: "목록",image: UIImage(systemName: "doc"),selectedImage: UIImage(systemName: "doc.fill"))
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    }
    //MARK: - addView
    override func addView() {
        view.addSubview(collectionView)
    }
    //MARK: - delegate
    override func delegate() {
        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    //MARK: - Setlayout
    override func setLayout() {
        collectionView.pin.all(view.pin.safeArea)
    }
    
    //MARK: - Bind

    
    override func bindView() {
        collectionView.rx.realmModelSelected(Photo.self)
            .subscribe(onNext : { [weak self] in
                self?.listener?.didTapCollectionViewRequest($0.id.stringValue)
            }).disposed(by: disposeBag)
    }
    override func bindState() {
        let dataSource = RxCollectionViewRealmDataSource<Photo>(cellIdentifier: "List", cellType: ListCollectionViewCell.self){ cell , indexPath, item in
            
            cell.date.text = Date().usingDate(time: item.date)
            cell.iv.image = ImageDirectory.shared.loadImageFromDocumentDirecotry(imageName: "\(item.id).png")
            
        }
        
        let realm = try! Realm()
        let photoset = Observable.changeset(from: realm.objects(Photo.self)).share()
                
        photoset
            .bind(to: collectionView.rx.realmChanges(dataSource))
            .disposed(by: disposeBag)
    }
    
}

extension ListHomeViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width/2 - 5 , height: bounds.height/3.25)
    }
}
