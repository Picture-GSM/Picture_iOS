//
//  AlbumHomeBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/21.
//

import RIBs

protocol AlbumHomeDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class AlbumHomeComponent: Component<AlbumHomeDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol AlbumHomeBuildable: Buildable {
    func build(withListener listener: AlbumHomeListener) -> AlbumHomeRouting
}

final class AlbumHomeBuilder: Builder<AlbumHomeDependency>, AlbumHomeBuildable {

    override init(dependency: AlbumHomeDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: AlbumHomeListener) -> AlbumHomeRouting {
        let component = AlbumHomeComponent(dependency: dependency)
        let viewController = AlbumHomeViewController()
        let interactor = AlbumHomeInteractor(presenter: viewController)
        interactor.listener = listener
        return AlbumHomeRouter(interactor: interactor, viewController: viewController)
    }
}
