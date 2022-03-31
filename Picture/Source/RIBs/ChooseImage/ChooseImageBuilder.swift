//
//  ChooseImageBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs

protocol ChooseImageDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ChooseImageComponent: Component<ChooseImageDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol ChooseImageBuildable: Buildable {
    func build(withListener listener: ChooseImageListener) -> ChooseImageRouting
}

final class ChooseImageBuilder: Builder<ChooseImageDependency>, ChooseImageBuildable {

    override init(dependency: ChooseImageDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ChooseImageListener) -> ChooseImageRouting {
        let component = ChooseImageComponent(dependency: dependency)
        let viewController = ChooseImageViewController()
        let interactor = ChooseImageInteractor(presenter: viewController)
        interactor.listener = listener
        return ChooseImageRouter(interactor: interactor, viewController: viewController)
    }
}
