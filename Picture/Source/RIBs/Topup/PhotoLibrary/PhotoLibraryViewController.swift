//
//  PhotoLibraryViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RxSwift
import UIKit
import RIBsUtil

protocol PhotoLibraryPresentableListener: AnyObject {
    func didTapClose()
}

final class PhotoLibraryViewController: UIViewController, PhotoLibraryPresentable, PhotoLibraryViewControllable {
    
    weak var listener: PhotoLibraryPresentableListener?
        
    fileprivate let selectedPhotoSubject = PublishSubject<UIImage>()
    
    
    init(closeButtonType : DismissButtonType){
        super.init(nibName: nil, bundle: nil)
        setupNavigationItem(with: closeButtonType, target: self, action: #selector(didTapClose))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupNavigationItem(with: .close, target: self, action: #selector(didTapClose))
    }
    
    //MARK: - navigationButton Action
    @objc
    private func didTapClose(){
        listener?.didTapClose()
    }
    
}
