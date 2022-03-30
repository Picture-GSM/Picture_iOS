//
//  StoredImageDashboardBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/30.
//

import RIBs

protocol StoredImageDashboardDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class StoredImageDashboardComponent: Component<StoredImageDashboardDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol StoredImageDashboardBuildable: Buildable {
    func build(withListener listener: StoredImageDashboardListener) -> StoredImageDashboardRouting
}

final class StoredImageDashboardBuilder: Builder<StoredImageDashboardDependency>, StoredImageDashboardBuildable {

    override init(dependency: StoredImageDashboardDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: StoredImageDashboardListener) -> StoredImageDashboardRouting {
        let component = StoredImageDashboardComponent(dependency: dependency)
        let viewController = StoredImageDashboardViewController()
        let interactor = StoredImageDashboardInteractor(presenter: viewController)
        interactor.listener = listener
        return StoredImageDashboardRouter(interactor: interactor, viewController: viewController)
    }
}
