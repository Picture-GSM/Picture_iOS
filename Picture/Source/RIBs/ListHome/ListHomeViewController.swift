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
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class ListHomeViewController: BaseViewController<ListHomeReactor>, ListHomePresentable, ListHomeViewControllable {
    //MARK: - Listener
    weak var listener: ListHomePresentableListener?
    
    
    //MARK: - initalizer
    override func configureUI() {
        
    }
    //MARK: - addView
    override func addView() {
        
    }
    //MARK: - Setlayout
    override func setLayout() {
        title = "List"
        tabBarItem = UITabBarItem(title: "목록",
                                  image: UIImage(systemName: "doc"),
                                  selectedImage: UIImage(systemName: "doc.fill"))
        
        
    }
    //MARK: - Bind
    override func bindView(reactor: ListHomeReactor) {
        
    }
}
