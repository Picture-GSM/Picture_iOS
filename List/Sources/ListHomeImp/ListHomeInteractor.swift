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
import RxRealm
import ImageRepository
import ListHome

protocol ListHomeRouting: ViewableRouting {
    func attachImageVerification(id : String)
    func detachImageVerification()
}

protocol ListHomePresentable: Presentable {
    var listener: ListHomePresentableListener? { get set }
    func update(_ photoSet :Observable<(AnyRealmCollection<Results<Photo>.ElementType>, RealmChangeset?)>)
}

protocol ListHomeInteractorDependency{
    var imageRepository : ImageRepository {get}
}
final class ListHomeInteractor: PresentableInteractor<ListHomePresentable>, ListHomeInteractable, ListHomePresentableListener,AdaptivePresentationControllerDelegate{

    weak var router: ListHomeRouting?
    weak var listener: ListHomeListener?

    var presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy

    private let dependency : ListHomeInteractorDependency
    
    init(
        presenter: ListHomePresentable,
        dependency : ListHomeInteractorDependency
    ) {
        self.presentationDelegateProxy = AdaptivePresentationControllerDelegateProxy()
        self.dependency = dependency
        super.init(presenter: presenter)
        presenter.listener = self
        presentationDelegateProxy.delegate = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        presenter.update(dependency.imageRepository.fetch())
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
