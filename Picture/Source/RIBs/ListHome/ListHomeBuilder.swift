//
//  ListHomeBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/17.
//

import RIBs

protocol ListHomeDependency: Dependency {
    var imageVerificationBuildable : ImageVerificationBuildable {get}
    var imageRepository: ImageRepository{get}
}

final class ListHomeComponent: Component<ListHomeDependency>, ListHomeInteractorDependency{
    var imageVerificationBuildable : ImageVerificationBuildable {dependency.imageVerificationBuildable}
    var imageRepository: ImageRepository{dependency.imageRepository}
}

// MARK: - Builder

protocol ListHomeBuildable: Buildable {
    func build(withListener listener: ListHomeListener) -> ListHomeRouting
}

final class ListHomeBuilder: Builder<ListHomeDependency>, ListHomeBuildable {

    override init(dependency: ListHomeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ListHomeListener) -> ListHomeRouting {
        let component = ListHomeComponent(dependency: dependency)
        let viewController = ListHomeViewController() 
        let interactor = ListHomeInteractor(
            presenter: viewController,
            dependency: component
        )
        interactor.listener = listener
        return ListHomeRouter(interactor: interactor, viewController: viewController, imageVerifivationBuildable: component.imageVerificationBuildable)
    }
}
