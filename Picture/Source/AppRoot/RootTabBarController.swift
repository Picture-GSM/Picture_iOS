//
//  AppRootViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/17.
//

import RIBs
import RxSwift
import UIKit

protocol AppRootPresentableListener: AnyObject {
    
}

final class RootTabBarController: UITabBarController, AppRootPresentable, AppRootViewControllable {
    
    weak var listener: AppRootPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.isTranslucent = false
        tabBar.tintColor = .black
        tabBar.barTintColor = .white
        tabBar.backgroundColor = .white
        
    }
    
    func setViewControllers(_ viewControllers: [ViewControllable]) {
        super.setViewControllers(viewControllers.map(\.uiviewController), animated: false)
    }
}
