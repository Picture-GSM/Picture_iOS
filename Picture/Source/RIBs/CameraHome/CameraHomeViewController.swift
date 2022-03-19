//
//  CameraHomeViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/20.
//

import RIBs
import RxSwift
import UIKit
import AVFoundation

protocol CameraHomePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class CameraHomeViewController: UIViewController, CameraHomePresentable, CameraHomeViewControllable {

    weak var listener: CameraHomePresentableListener?
}
