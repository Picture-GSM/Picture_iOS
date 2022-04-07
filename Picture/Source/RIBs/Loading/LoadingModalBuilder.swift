//
//  LoadingModalBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import RIBs

protocol LoadingModalDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class LoadingModalComponent: Component<LoadingModalDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol LoadingModalBuildable: Buildable {
    func build(withListener listener: LoadingModalListener) -> LoadingModalRouting
}

final class LoadingModalBuilder: Builder<LoadingModalDependency>, LoadingModalBuildable {

    override init(dependency: LoadingModalDependency) {
        super.init(dependency: dependency)
    }
        
    func build(withListener listener: LoadingModalListener) -> LoadingModalRouting {
        let component = LoadingModalComponent(dependency: dependency)
        let viewController = LoadingModalViewController()
        
        let interactor = LoadingModalInteractor(presenter: viewController)
        interactor.listener = listener
        
        
        return LoadingModalRouter(
            interactor: interactor,
            viewController: viewController
        )
    }
}
