//
//  TopupBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RIBsUtil

protocol TopupDependency: Dependency {
    var topupBaseViewController: ViewControllable { get }
}

final class TopupComponent: Component<TopupDependency> , CameraDependency, DecideImageDependency{
    

    // TODO: Make sure to convert the variable into lower-camelcase.
    fileprivate var topupBaseViewController: ViewControllable {
        return dependency.topupBaseViewController
    }

}

// MARK: - Builder

protocol TopupBuildable: Buildable {
    func build(withListener listener: TopupListener, originerPictureStatus: Bool) -> Routing
}

final class TopupBuilder: Builder<TopupDependency>, TopupBuildable {

    override init(dependency: TopupDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TopupListener, originerPictureStatus: Bool) -> Routing {
        let component = TopupComponent(dependency: dependency)
        let interactor = TopupInteractor(originerPictureStatus: originerPictureStatus)
        interactor.listener = listener
        
        let cameraBuilder = CameraBuilder(dependency: component)
        let decideImageBuilder = DecideImageBuilder(dependency: component)
        
        return TopupRouter(
            interactor: interactor,
            viewController: component.topupBaseViewController,
            cameraBuildable: cameraBuilder,
            decideImageBuildable: decideImageBuilder
        )
    }
}