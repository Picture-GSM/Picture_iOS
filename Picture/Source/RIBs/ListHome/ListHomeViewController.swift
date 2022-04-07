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
import RxDataSources

protocol ListHomePresentableListener: AnyObject {

}

final class ListHomeViewController: BaseViewController, ListHomePresentable, ListHomeViewControllable {
    //MARK: - Listener
    weak var listener: ListHomePresentableListener?
    
    //MARK: - Properties
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        let layout = UICollectionViewFlowLayout()
        $0.backgroundColor = .red
    }
    
    
    //MARK: - initalizer
    override func configureUI() {
        title = "List"
        tabBarItem = UITabBarItem(title: "목록",image: UIImage(systemName: "doc"),selectedImage: UIImage(systemName: "doc.fill"))
    }
    //MARK: - addView
    override func addView() {
        view.addSubview(collectionView)
    }
    //MARK: - delegate
    override func delegate() {
    }
    
    //MARK: - Setlayout
    override func setLayout() {
        collectionView.pin.all(view.pin.safeArea)
    }
    
    //MARK: - Bind
    override func bindView() {
        
    }
    override func bindAction() {
        
    }
}
