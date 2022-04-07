//
//  LoadingModalInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import RIBs
import RxSwift

protocol LoadingModalRouting: ViewableRouting {

}

protocol LoadingModalPresentable: Presentable {
    var listener: LoadingModalPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol LoadingModalListener: AnyObject {
    func didClearTrainingMachine()
}

final class LoadingModalInteractor: PresentableInteractor<LoadingModalPresentable>, LoadingModalInteractable, LoadingModalPresentableListener {

    weak var router: LoadingModalRouting?
    weak var listener: LoadingModalListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: LoadingModalPresentable) {
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
    
    func didClearTrainingMachine() {
        listener?.didClearTrainingMachine()
    }
}
