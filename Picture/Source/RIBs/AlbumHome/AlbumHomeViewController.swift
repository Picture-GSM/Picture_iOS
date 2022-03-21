//
//  AlbumHomeViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/21.
//

import RIBs
import RxSwift
import UIKit

protocol AlbumHomePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class AlbumHomeViewController: UIViewController, AlbumHomePresentable, AlbumHomeViewControllable {

    weak var listener: AlbumHomePresentableListener?
}
