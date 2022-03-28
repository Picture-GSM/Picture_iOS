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
import ReactorKit

//MARK: - Action
enum ListAction{
    
}
//MARK: - State
struct ListState{
    
}


protocol ListHomePresentableListener: AnyObject {
//    var action: ActionSubject<ListAction> { get }
//    var state: Observable<ListState> { get }
}

final class ListHomeViewController: BaseViewController, ListHomePresentable, ListHomeViewControllable {
    //MARK: - Listener
    weak var listener: ListHomePresentableListener?
    
    //MARK: - Properties
    private let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .red
        return cv
    }()
    
    
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
