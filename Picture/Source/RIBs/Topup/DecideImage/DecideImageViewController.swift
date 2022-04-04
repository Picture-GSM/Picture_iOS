//
//  DecideImageViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/04.
//

import RIBs
import RxSwift
import UIKit

protocol DecideImagePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class DecideImageViewController: UIViewController, DecideImagePresentable, DecideImageViewControllable {

    weak var listener: DecideImagePresentableListener?
}
