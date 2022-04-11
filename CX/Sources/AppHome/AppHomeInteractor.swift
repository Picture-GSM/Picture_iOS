//
//  AppHomeInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import RIBs
import RxSwift
import RxRealm
import RealmSwift
import ImageRepository

protocol AppHomeRouting: ViewableRouting {
    func attachChooseImage()
    func detachChooseImage()
}

protocol AppHomePresentable: Presentable {
    var listener: AppHomePresentableListener? { get set }
    func update(_ photoSet :Observable<(AnyRealmCollection<Results<Photo>.ElementType>, RealmChangeset?)>)
}

public protocol AppHomeListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}
protocol AppHomeInteractorDependency{
    var imageRepository : ImageRepository {get}
}

final class AppHomeInteractor: PresentableInteractor<AppHomePresentable>, AppHomeInteractable, AppHomePresentableListener {

    
    weak var router: AppHomeRouting?
    weak var listener: AppHomeListener?
    
    private let dependency : AppHomeInteractorDependency

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    init(
        presenter: AppHomePresentable,
        dependency : AppHomeInteractorDependency
    ) {
        self.dependency = dependency
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        presenter.update(dependency.imageRepository.fetch())
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    //MARK: - Attach
    func didTapAddBtn() {
        router?.attachChooseImage()
    }
    //MARK: - Detach
    func transportHomeDidClose() {
        router?.detachChooseImage()
    }
}
