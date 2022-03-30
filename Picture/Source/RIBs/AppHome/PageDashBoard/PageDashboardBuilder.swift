//
//  PageDashboardBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/30.
//

import RIBs

protocol PageDashboardDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class PageDashboardComponent: Component<PageDashboardDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol PageDashboardBuildable: Buildable {
    func build(withListener listener: PageDashboardListener) -> PageDashboardRouting
}

final class PageDashboardBuilder: Builder<PageDashboardDependency>, PageDashboardBuildable {

    override init(dependency: PageDashboardDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: PageDashboardListener) -> PageDashboardRouting {
        let component = PageDashboardComponent(dependency: dependency)
        let viewController = PageDashboardViewController()
        let interactor = PageDashboardInteractor(presenter: viewController)
        interactor.listener = listener
        return PageDashboardRouter(interactor: interactor, viewController: viewController)
    }
}
