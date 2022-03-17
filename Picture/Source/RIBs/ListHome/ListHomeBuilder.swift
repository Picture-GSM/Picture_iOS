//
//  ListHomeBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/17.
//

import RIBs

protocol ListHomeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class ListHomeComponent: Component<ListHomeDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
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
        let interactor = ListHomeInteractor(presenter: viewController)
        interactor.listener = listener
        return ListHomeRouter(interactor: interactor, viewController: viewController)
    }
}
