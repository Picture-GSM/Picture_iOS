//
//  ChooseImageInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RxSwift
import UIUtil
import UIKit

protocol ChooseImageRouting: ViewableRouting {
    func attachLoading()
    func detachLoading()
}

protocol ChooseImagePresentable: Presentable {
    var listener: ChooseImagePresentableListener? { get set }
    
}

protocol ChooseImageListener: AnyObject {
    func transportHomeDidClose()
}

final class ChooseImageInteractor: PresentableInteractor<ChooseImagePresentable>, ChooseImageInteractable, ChooseImagePresentableListener{



    weak var router: ChooseImageRouting?
    weak var listener: ChooseImageListener?


    override init(presenter: ChooseImagePresentable) {
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

    
    func didTapBack() {
        listener?.transportHomeDidClose()
    }

    func didTapStartButton() {
        router?.attachLoading()
    }
}
