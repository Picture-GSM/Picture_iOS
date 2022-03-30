//
//  AppHomeBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import RIBs

protocol AppHomeDependency: Dependency {
    var topupBuildable : TopupBuildable{get}
    var albumBuildable : AlbumHomeBuildable {get}
  
}

final class AppHomeComponent: Component<AppHomeDependency>  , PageDashboardDependency, StoredImageDashboardDependency{
    var topupBuildable : TopupBuildable {dependency.topupBuildable}
    var albumBuildable : AlbumHomeBuildable {dependency.albumBuildable}

}

// MARK: - Builder

protocol AppHomeBuildable: Buildable {
    func build(withListener listener: AppHomeListener) -> AppHomeRouter
}

final class AppHomeBuilder: Builder<AppHomeDependency>, AppHomeBuildable {

    override init(dependency: AppHomeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: AppHomeListener) -> AppHomeRouter{
        let component = AppHomeComponent(dependency: dependency)
        let viewController = AppHomeViewController()
        let interactor = AppHomeInteractor(presenter: viewController)
        interactor.listener = listener
        
        let storedImageDashboardBuildable = StoredImageDashboardBuilder(dependency: component)
        let pageDashboardBuildable = PageDashboardBuilder(dependency: component)
        
        return AppHomeRouter(
            interactor: interactor,
            viewController: viewController,
            topupBuildable: component.topupBuildable,
            albumBuildable: component.albumBuildable)
    }
}
