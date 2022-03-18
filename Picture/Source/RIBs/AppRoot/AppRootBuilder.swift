//
//  AppRootBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/17.
//

import RIBs

protocol AppRootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class AppRootComponent: Component<AppRootDependency>, AppHomeDependency , ListHomeDependency{

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol AppRootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class AppRootBuilder: Builder<AppRootDependency>, AppRootBuildable {

    override init(dependency: AppRootDependency) {
        super.init(dependency: dependency)
    }

    func build() -> LaunchRouting {
        let component = AppRootComponent(dependency: dependency)
        
        let tabbar = RootTabBarController()
        
        let interactor = AppRootInteractor(presenter: tabbar)
        
        let appHome = AppHomeBuilder(dependency: component)
        
        let listHome = ListHomeBuilder(dependency: component)
        
        return AppRootRouter(interactor: interactor,
                             viewController: tabbar,
                             appHome: appHome,
                             listHome: listHome)
    }
}
