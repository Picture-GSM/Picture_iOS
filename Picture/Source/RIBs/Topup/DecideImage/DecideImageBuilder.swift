//
//  DecideImageBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/04.
//

import RIBs

protocol DecideImageDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class DecideImageComponent: Component<DecideImageDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol DecideImageBuildable: Buildable {
    func build(withListener listener: DecideImageListener) -> DecideImageRouting
}

final class DecideImageBuilder: Builder<DecideImageDependency>, DecideImageBuildable {

    override init(dependency: DecideImageDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: DecideImageListener) -> DecideImageRouting {
        let component = DecideImageComponent(dependency: dependency)
        let viewController = DecideImageViewController()
        let interactor = DecideImageInteractor(presenter: viewController)
        interactor.listener = listener
        return DecideImageRouter(interactor: interactor, viewController: viewController)
    }
}
