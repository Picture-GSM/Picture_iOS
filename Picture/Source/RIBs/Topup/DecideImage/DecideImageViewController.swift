//
//  DecideImageViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/04.
//

import RIBs
import RxSwift
import UIKit
import PinLayout

protocol DecideImagePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class DecideImageViewController: BaseViewController, DecideImagePresentable, DecideImageViewControllable {

    weak var listener: DecideImagePresentableListener?
    
    private let imageView = UIImageView().then{
        $0.backgroundColor = .red
    }
    
    override func configureUI() {
        title = "Decide"
        view.backgroundColor = .white
    }
    override func addView() {
        view.addSubviews(imageView)
    }
    override func setLayout() {
        imageView.pin.height(40%).width(100%).center()
    }
}
