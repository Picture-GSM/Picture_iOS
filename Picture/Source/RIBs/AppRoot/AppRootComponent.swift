//
//  AppRootComponent.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/28.
//

import RIBs
import RIBsUtil
import ImageVerification
import ListHome
import ChooseImage
import Loading
import ImageRepository
import AppHome

final class AppRootComponent: Component<AppRootDependency>, AppHomeDependency , ListHomeDependency, ChooseImageDependency, LoadingModalDependency, ImageVerificationDependency{
    
    var imageRepository: ImageRepository
    

    lazy var imageVerificationBuildable: ImageVerificationBuildable = {
        return ImageVerificationBuilder(dependency: self)
    }()
    
    lazy var loadingModalBuildable: LoadingModalBuildable = {
       return LoadingModalBuilder(dependency: self)
    }()

    lazy var chooseImageBuildable: ChooseImageBuildable = {
        return ChooseImageBuilder(dependency: self)
    }()
    
    private let rootViewController : ViewControllable

     init(
        dependency: AppRootDependency,
        rootViewController: ViewControllable
    ) {
        self.rootViewController = rootViewController
        self.imageRepository = ImageRepositoryImp()
        super.init(dependency: dependency)
    }
}
