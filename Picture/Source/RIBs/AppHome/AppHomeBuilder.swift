//
//  AppHomeBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import RIBs

protocol AppHomeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class AppHomeComponent: Component<AppHomeDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol AppHomeBuildable: Buildable {
    func build() -> LaunchRouting
}

final class AppHomeBuilder: Builder<AppHomeDependency>, AppHomeBuildable {

    override init(dependency: AppHomeDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = AppHomeComponent(dependency: dependency)
        let viewController = AppHomeViewController(reactor: AppHomeReactor()) // 고쳐야됨
        let interactor = AppHomeInteractor(presenter: viewController)

        return AppHomeRouter(interactor: interactor, viewController: viewController)
    }
}
