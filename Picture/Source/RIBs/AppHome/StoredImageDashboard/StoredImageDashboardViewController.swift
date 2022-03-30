//
//  StoredImageDashboardViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/30.
//

import RIBs
import RxSwift
import UIKit

protocol StoredImageDashboardPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class StoredImageDashboardViewController: UIViewController, StoredImageDashboardPresentable, StoredImageDashboardViewControllable {

    weak var listener: StoredImageDashboardPresentableListener?
}
