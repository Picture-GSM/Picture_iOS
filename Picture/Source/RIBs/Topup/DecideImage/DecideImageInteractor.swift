//
//  DecideImageInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/04.
//

import RIBs
import RxSwift
import UIKit

protocol DecideImageRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol DecideImagePresentable: Presentable {
    var listener: DecideImagePresentableListener? { get set }

    func setImage(_ image : UIImage)
}

protocol DecideImageListener: AnyObject {
    func didTapClose()
}

final class DecideImageInteractor: PresentableInteractor<DecideImagePresentable>, DecideImageInteractable, DecideImagePresentableListener {

    weak var router: DecideImageRouting?
    weak var listener: DecideImageListener?

    private let image : UIImage
    
    init(
        presenter: DecideImagePresentable,
        image : UIImage
    ) {
        self.image = image
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        presenter.setImage(image)
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func didTapClose() {
        listener?.didTapClose()
    }
    func didTapSave() {
        print("DidTap Save")
    }
}
