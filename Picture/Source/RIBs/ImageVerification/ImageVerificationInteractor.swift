//
//  ImageVerificationInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import RIBs
import RxSwift
import UIKit

protocol ImageVerificationRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ImageVerificationPresentable: Presentable {
    var listener: ImageVerificationPresentableListener? { get set }
    func update(image : UIImage, imageStateAlready : Bool)
}

protocol ImageVerificationListener: AnyObject {
    func didTapImageVerificationClose()
    func didTapImageVerificationSaveSuccess()
}

protocol ImageVerificationInteractorDependency{
    var imageRepository : ImageRepository {get}
}

final class ImageVerificationInteractor: PresentableInteractor<ImageVerificationPresentable>, ImageVerificationInteractable, ImageVerificationPresentableListener {

    

    weak var router: ImageVerificationRouting?
    weak var listener: ImageVerificationListener?

    private let dependency : ImageVerificationInteractorDependency
    
    private let image : UIImage
    private let imageStateAlready : Bool
    
    init(
        presenter: ImageVerificationPresentable,
        withImage image : UIImage,
        imageStateAlready : Bool,
        dependency : ImageVerificationInteractorDependency
    ) {
        self.dependency = dependency
        self.imageStateAlready = imageStateAlready
        self.image = image
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        presenter.update(image: image, imageStateAlready: imageStateAlready)
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func didTapClose() {
        listener?.didTapImageVerificationClose()
    }

    func didTapSaveSuccess(_ image: UIImage) {
        if !imageStateAlready{
            dependency.imageRepository.addImage(saveImage: image)
        }
        ImageManager.shared.saveImage(image: image)
        listener?.didTapImageVerificationSaveSuccess()
    }
}
