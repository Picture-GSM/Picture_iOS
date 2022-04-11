//
//  AppHomeBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import RIBs
import ImageRepository
import ChooseImage

public protocol AppHomeDependency: Dependency {
    var imageRepository: ImageRepository{get}
    var chooseImageBuildable: ChooseImageBuildable {get}
}

final class AppHomeComponent: Component<AppHomeDependency> , AppHomeInteractorDependency{
    var imageRepository: ImageRepository {dependency.imageRepository}
    var chooseImageBuildable: ChooseImageBuildable { dependency.chooseImageBuildable }
}

// MARK: - Builder
public protocol AppHomeBuildable: Buildable {
    func build(withListener listener: AppHomeListener) -> ViewableRouting
}

public final class AppHomeBuilder: Builder<AppHomeDependency>, AppHomeBuildable {

    public override init(dependency: AppHomeDependency) {
        super.init(dependency: dependency)
    }

    public func build(withListener listener: AppHomeListener) -> ViewableRouting{
        let component = AppHomeComponent(dependency: dependency)
        let viewController = AppHomeViewController()
        let interactor = AppHomeInteractor(
            presenter: viewController,
            dependency: component
        )
        interactor.listener = listener
        
        return AppHomeRouter(
            interactor: interactor,
            viewController: viewController,
            chooseImageBuildable: component.chooseImageBuildable
        )
    }
}
