//
//  StoredImageDashboardInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/30.
//

import RIBs
import RxSwift

protocol StoredImageDashboardRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol StoredImageDashboardPresentable: Presentable {
    var listener: StoredImageDashboardPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol StoredImageDashboardListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class StoredImageDashboardInteractor: PresentableInteractor<StoredImageDashboardPresentable>, StoredImageDashboardInteractable, StoredImageDashboardPresentableListener {

    weak var router: StoredImageDashboardRouting?
    weak var listener: StoredImageDashboardListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: StoredImageDashboardPresentable) {
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
