//
//  CameraHomeBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/20.
//

import RIBs

protocol CameraHomeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class CameraHomeComponent: Component<CameraHomeDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol CameraHomeBuildable: Buildable {
    func build(withListener listener: CameraHomeListener) -> CameraHomeRouting
}

final class CameraHomeBuilder: Builder<CameraHomeDependency>, CameraHomeBuildable {

    override init(dependency: CameraHomeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: CameraHomeListener) -> CameraHomeRouting {
        let _ = CameraHomeComponent(dependency: dependency)
        let viewController = CameraHomeViewController()
        let interactor = CameraHomeInteractor(presenter: viewController)
        interactor.listener = listener
        return CameraHomeRouter(interactor: interactor, viewController: viewController)
    }
}
