//
//  ImageVerificationBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import RIBs
import UIKit

protocol ImageVerificationDependency: Dependency {
    var imageRepository: ImageRepository{get}
}

final class ImageVerificationComponent: Component<ImageVerificationDependency> , ImageVerificationInteractorDependency{
    var imageRepository: ImageRepository{dependency.imageRepository}
}

// MARK: - Builder

protocol ImageVerificationBuildable: Buildable {
    func build(withListener listener: ImageVerificationListener, withImage image : UIImage, withState imageStateAlready : Bool) -> ImageVerificationRouting
}

final class ImageVerificationBuilder: Builder<ImageVerificationDependency>, ImageVerificationBuildable {

    override init(dependency: ImageVerificationDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: ImageVerificationListener,withImage image : UIImage,withState imageStateAlready: Bool) -> ImageVerificationRouting {
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
