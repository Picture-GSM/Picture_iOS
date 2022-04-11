//
//  LoadingModalBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import RIBs
import UIKit
import Loading

public protocol LoadingModalDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class LoadingModalComponent: Component<LoadingModalDependency> {

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

public final class LoadingModalBuilder: Builder<LoadingModalDependency>, LoadingModalBuildable {

    public override init(dependency: LoadingModalDependency) {
        super.init(dependency: dependency)
    }
        
    public func build(withListener listener: LoadingModalListener,originerImage: UIImage, pieceImage: UIImage) -> ViewableRouting {
        let component = LoadingModalComponent(dependency: dependency)
        let viewController = LoadingModalViewController()
        
        let interactor = LoadingModalInteractor(presenter: viewController, originerImage: originerImage, pieceImage: pieceImage)
        interactor.listener = listener
        
        
        return LoadingModalRouter(
            interactor: interactor,
            viewController: viewController
        )
    }
}
