//
//  ListHomeInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/17.
//

import RIBs
import RxSwift
import RealmSwift

protocol ListHomeRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol ListHomePresentable: Presentable {
    var listener: ListHomePresentableListener? { get set }
    
}

protocol ListHomeListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class ListHomeInteractor: PresentableInteractor<ListHomePresentable>, ListHomeInteractable, ListHomePresentableListener {
    
    weak var router: ListHomeRouting?
    weak var listener: ListHomeListener?

    
    
    override init(presenter: ListHomePresentable) {
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
