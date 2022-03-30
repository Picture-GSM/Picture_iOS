//
//  AppHomeInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import RIBs
import RxSwift

protocol AppHomeRouting: ViewableRouting {
    func attachPageDashboard()

    func attachTopup(btnState : btnOption)
    func detachTopup()

    func attachAlbum()
    func detachAlbum()
}

protocol AppHomePresentable: Presentable {
    var listener: AppHomePresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol AppHomeListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class AppHomeInteractor: PresentableInteractor<AppHomePresentable>, AppHomeInteractable, AppHomePresentableListener {

    
    
    weak var router: AppHomeRouting?
    weak var listener: AppHomeListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: AppHomePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        router?.attachPageDashboard()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    //MARK: - Action
    func didTapCamera() {
        router?.attachTopup(btnState: .camera)
    }
    
    func didTapAlbum() {
        router?.attachAlbum()
    }
    func topupDidClose() {
        router?.detachTopup()
    }
    
    func topupDidFinish() {
        router?.detachTopup()
    }

    func transportHomeDidTapClose() {
        router?.detachAlbum()
    }
}
