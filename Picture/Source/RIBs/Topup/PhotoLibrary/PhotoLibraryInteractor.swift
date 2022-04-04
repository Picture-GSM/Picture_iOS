//
//  PhotoLibraryInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RxSwift
import UIUtil
import UIKit

protocol PhotoLibraryRouting: ViewableRouting {

}

protocol PhotoLibraryPresentable: Presentable {
    var listener: PhotoLibraryPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol PhotoLibraryListener: AnyObject {
    func didPhotoLibraryDidTapClose()
    func didDecideImageDidTap(image : UIImage)
}


final class PhotoLibraryInteractor: PresentableInteractor<PhotoLibraryPresentable>, PhotoLibraryInteractable, PhotoLibraryPresentableListener {

    

    weak var router: PhotoLibraryRouting?
    weak var listener: PhotoLibraryListener?
    

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: PhotoLibraryPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        
        // TODO: Pause any business logic.
    }
    
    func didTapClose() {
        listener?.didPhotoLibraryDidTapClose()
    }
    func didTapPhotoLibraryImage(_ image: UIImage) {
        listener?.didDecideImageDidTap(image: image)
    }

}
