//
//  AppRootViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/10.
//

import RIBs
import RxSwift
import UIKit
import PinLayout

protocol AppRootPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class AppRootViewController: UIViewController, AppRootPresentable, AppRootViewControllable {

    weak var listener: AppRootPresentableListener?
    
    //MARK: - Initalizer
    init(){
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
}
