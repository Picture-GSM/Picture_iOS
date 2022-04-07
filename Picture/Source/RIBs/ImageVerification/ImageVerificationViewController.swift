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
import RxRealm
import RealmSwift

protocol ImageVerificationPresentableListener: AnyObject {
    func didTapClose()
    func didTapSaveSuccess()
}

final class ImageVerificationViewController: BaseViewController, ImageVerificationPresentable, ImageVerificationViewControllable {

    let localReam = try! Realm()
    
    weak var listener: ImageVerificationPresentableListener?
    
    private let imageView = UIImageView().then{
        $0.backgroundColor = .lightGray
        $0.contentMode = .scaleAspectFill
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
        let task = Photo(date: Date())
        try! localReam.write{
            localReam.add(task)
            ImageDirectory.shared.saveImageToDocumentDirectory(imageName: "\(task.id).png", image: imageView.image!)
        }
        ImageManager.shared.saveImage(image: imageView.image ?? UIImage())
        listener?.didTapSaveSuccess()
    }
    
    //MARK: - Presenter
    func update(image: UIImage) {
        imageView.image = image
    }
}
