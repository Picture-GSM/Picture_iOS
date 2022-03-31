//
//  ChooseImageBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs

protocol ChooseImageDependency: Dependency {
    var topupBuildable: TopupBuildable { get }
}

final class ChooseImageComponent: Component<ChooseImageDependency> {
    var topupBuildable: TopupBuildable { dependency.topupBuildable }

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
        
        
        return ChooseImageRouter(
            interactor: interactor,
            viewController: viewController,
            topupBuildable: component.topupBuildable)
    }
}
