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
    func didTapClose()
    func didTapSave(image : UIImage)
}

final class DecideImageViewController: BaseViewController, DecideImagePresentable, DecideImageViewControllable {

    weak var listener: DecideImagePresentableListener?
    
    private let imageView = UIImageView().then{
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
    }
    
    override func configureUI() {
        view.backgroundColor = .white
        setupNavigationItem(with: .back, target: self, action: #selector(didTapClose))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(didTapSave))
    }
    override func addView() {
        view.addSubviews(imageView)
    }
    override func setLayout() {
        imageView.pin.size(bounds.width).center()
    }
    
    //MARK: - listener
    func setImage(_ image: UIImage) {
        imageView.image = UIImage().CropImage(image: image)
    }
    //MARK: - Selector
    @objc
    private func didTapClose(){
        listener?.didTapClose()
    }
    
    @objc
    private func didTapSave(){
        listener?.didTapSave(image: imageView.image ?? UIImage())
    }
    
}
