//
//  ImageVerificationViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import RIBs
import RxSwift
import UIKit
import PinLayout

protocol ImageVerificationPresentableListener: AnyObject {
    func didTapClose()
}

final class ImageVerificationViewController: BaseViewController, ImageVerificationPresentable, ImageVerificationViewControllable {

    weak var listener: ImageVerificationPresentableListener?
    
    private let imageView = UIImageView().then{
        $0.backgroundColor = .lightGray
    }
    
    //MARK: - Method
    override func configureUI() {
        title = "Verification"
        setupNavigationItem(with: .close, target: self, action: #selector(didTapClose))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(didTapSave))
    }
    override func addView() {
        view.addSubviews(imageView)
    }
    override func setLayout() {
        imageView.pin.center().size(bounds.width)
    }
    
    //MARK: - Navigation Action
    @objc
    private func didTapClose(){
        listener?.didTapClose()
    }
    
    @objc
    private func didTapSave(){
        
    }
}
