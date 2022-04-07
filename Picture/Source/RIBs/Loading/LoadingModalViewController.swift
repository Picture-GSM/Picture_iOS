//
//  LoadingModalViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import RIBs
import RxSwift
import UIKit

protocol LoadingModalPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class LoadingModalViewController: UIViewController, LoadingModalPresentable, LoadingModalViewControllable {

    weak var listener: LoadingModalPresentableListener?
}
