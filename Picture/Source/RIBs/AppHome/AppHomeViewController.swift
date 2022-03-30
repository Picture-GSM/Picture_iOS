//
//  AppHomeViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import RIBs
import RxSwift
import RxCocoa
import RxDataSources


import UIKit
import UIUtil
import RxUtil
import Then
import Reusable
import PinLayout
import Floaty


protocol AppHomePresentableListener: AnyObject {
    func didTapCamera()
    func didTapAlbum()
}

final class AppHomeViewController: BaseViewController, AppHomePresentable, AppHomeViewControllable {

    
    
    //MARK: - Properties
    weak var listener: AppHomePresentableListener?
    
    
    private let pageStackView = UIStackView().then{
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
        $0.spacing = 4
    }
    
    
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
        
        $0.backgroundColor = .red
    }
    
    private let menuBtn = floatyAddBtn()
    
    //MARK: - Main
    override func configureUI() {
        title = "Home"
        tabBarItem = UITabBarItem(title: "홈",
                                  image: UIImage(systemName: "house"),
                                  selectedImage: UIImage(systemName: "house.fill"))
    }
    
    override func addView() {
        view.addSubviews(pageStackView,titleLabel,collectionView,menuBtn)
    }
    
    override func setLayout() {
        pageStackView.pin.top(self.view.pin.safeArea.top).right().left().height(bounds.height/2)
//        scrollView.pin.top(self.view.pin.safeArea.top).right().left().height(bounds.height/2)
//        pageControl.pin.below(of: scrollView).height(20).left().right()
        titleLabel.pin.left(bounds.width/18.75).below(of: pageStackView).width(200).height(20)
        collectionView.pin.below(of: titleLabel).left().right().height(bounds.height/8.12)
        menuBtn.pin.below(of: collectionView).right(bounds.width/18.75).size(50)
    }
    
    override func delegate() {
        
    }
    

    
    //MARK: - Bind
    override func bindView() {
        
        menuBtn.albumItem.rx.handler.asObserver().onNext { _ in
            self.listener?.didTapAlbum()
        }
        menuBtn.cameraItem.rx.handler.asObserver().onNext{ _ in
            self.listener?.didTapCamera()
        }
    }
    
    override func bindState() {
        
    }
    
    func addDashboard(_ view: ViewControllable) {
        let vc = view.uiviewController
        
        addChild(vc)
        pageStackView.addArrangedSubview(vc.view)
        vc.didMove(toParent: self)
    }
}
