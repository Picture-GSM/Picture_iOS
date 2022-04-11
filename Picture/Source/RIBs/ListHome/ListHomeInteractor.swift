//
//  ListHomeInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/17.
//

import RIBs
import RxSwift
import RealmSwift
import UIUtil

protocol ListHomeRouting: ViewableRouting {
    func attachImageVerification(id : String)
    func detachImageVerification()
}

protocol ListHomePresentable: Presentable {
    var listener: ListHomePresentableListener? { get set }
    
}

protocol ListHomeListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ListHomeInteractor: PresentableInteractor<ListHomePresentable>, ListHomeInteractable, ListHomePresentableListener,AdaptivePresentationControllerDelegate{

    
    weak var router: ListHomeRouting?
    weak var listener: ListHomeListener?

    var presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy

    
    override init(presenter: ListHomePresentable) {
        self.presentationDelegateProxy = AdaptivePresentationControllerDelegateProxy()
        super.init(presenter: presenter)
        presenter.listener = self
        presentationDelegateProxy.delegate = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    func didTapCollectionViewRequest(_ id: String) {
        router?.attachImageVerification(id: id)
    }

    func didTapImageVerificationClose() {
        router?.detachImageVerification()
    }
    
    func didTapImageVerificationSaveSuccess() {
        router?.detachImageVerification()
    }
    func presetationControllerDidDismiss() {
        router?.detachImageVerification()
    }
}
