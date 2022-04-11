//
//  ImageVerificationBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import RIBs
import UIKit
import ImageRepository

public protocol ImageVerificationDependency: Dependency {
    var imageRepository: ImageRepository{get}
}

final class ImageVerificationComponent: Component<ImageVerificationDependency> , ImageVerificationInteractorDependency{
    var imageRepository: ImageRepository{dependency.imageRepository}
}

// MARK: - Builder

public protocol ImageVerificationBuildable: Buildable {
    func build(withListener listener: ImageVerificationListener, withImage image : UIImage, withState imageStateAlready : Bool) -> ViewableRouting
}

public final class ImageVerificationBuilder: Builder<ImageVerificationDependency>, ImageVerificationBuildable {

    public override init(dependency: ImageVerificationDependency) {
        super.init(dependency: dependency)
    }

    public func build(withListener listener: ImageVerificationListener,withImage image : UIImage,withState imageStateAlready: Bool) -> ViewableRouting {
        let component = ImageVerificationComponent(dependency: dependency)
        let viewController = ImageVerificationViewController()
        let interactor = ImageVerificationInteractor(
            presenter: viewController,
            withImage: image,
            imageStateAlready: imageStateAlready,
            dependency: component
        )
        interactor.listener = listener
        return ImageVerificationRouter(interactor: interactor, viewController: viewController)
    }
}
