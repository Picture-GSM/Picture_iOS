//
//  AppRootBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/17.
//

import RIBs
import ListHome

protocol AppRootDependency: Dependency {
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
        let tabbar = RootTabBarController()

        let component = AppRootComponent(dependency: dependency,
                                         rootViewController: tabbar)
        
        let interactor = AppRootInteractor(presenter: tabbar)
        
        let appHome = AppHomeBuilder(dependency: component)
        
        let listHome = ListHomeBuilder(dependency: component)
        
        return AppRootRouter(interactor: interactor,
                             viewController: tabbar,
                             appHome: appHome,
                             listHome: listHome)
    }
}
