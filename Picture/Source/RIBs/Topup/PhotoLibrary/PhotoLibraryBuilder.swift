//
//  PhotoLibraryBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RIBsUtil
protocol PhotoLibraryDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class PhotoLibraryComponent: Component<PhotoLibraryDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol PhotoLibraryBuildable: Buildable {
    func build(withListener listener: PhotoLibraryListener, closeButtonType: DismissButtonType) -> PhotoLibraryRouting
}

final class PhotoLibraryBuilder: Builder<PhotoLibraryDependency>, PhotoLibraryBuildable {

    override init(dependency: PhotoLibraryDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: PhotoLibraryListener, closeButtonType: DismissButtonType) -> PhotoLibraryRouting {
        let component = PhotoLibraryComponent(dependency: dependency)
        let viewController = PhotoLibraryViewController(closeButtonType: closeButtonType)
        let interactor = PhotoLibraryInteractor(presenter: viewController)
        interactor.listener = listener
        return PhotoLibraryRouter(interactor: interactor, viewController: viewController)
    }
}
