//
//  ImageVerificationInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import RIBs
import RxSwift

protocol ImageVerificationRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ImageVerificationPresentable: Presentable {
    var listener: ImageVerificationPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol ImageVerificationListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ImageVerificationInteractor: PresentableInteractor<ImageVerificationPresentable>, ImageVerificationInteractable, ImageVerificationPresentableListener {

    weak var router: ImageVerificationRouting?
    weak var listener: ImageVerificationListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: ImageVerificationPresentable) {
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
}
