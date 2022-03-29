//
//  TopupBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/28.
//

import RIBs

protocol TopupDependency: Dependency {
    var topupBaseViewController: ViewControllable { get }
    var btnState : btnOption {get}
}

final class TopupComponent: Component<TopupDependency>, CameraHomeDependency, AlbumHomeDependency, TopupInteractorDependency{
    var btnState: btnOption {dependency.btnState}
    
    fileprivate var topupBaseViewController: ViewControllable {
        return dependency.topupBaseViewController
    }
}

// MARK: - Builder

protocol TopupBuildable: Buildable {
    func build(withListener listener: TopupListener) -> TopupRouting
}

final class TopupBuilder: Builder<TopupDependency>, TopupBuildable {
    
    override init(dependency: TopupDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TopupListener) -> TopupRouting {
        let component = TopupComponent(dependency: dependency)
        let interactor = TopupInteractor(dependency: component)
        interactor.listener = listener
        
        let cameraHomeBuilder = CameraHomeBuilder(dependency: component)
        let albumHomeBuilder  = AlbumHomeBuilder(dependency: component)
        
        return TopupRouter(
            interactor: interactor,
            viewController: component.topupBaseViewController,
            cameraBuildable: cameraHomeBuilder,
            albumBuildable: albumHomeBuilder
        )
    }
}
