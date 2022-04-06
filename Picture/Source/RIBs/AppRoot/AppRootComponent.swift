//
//  AppRootComponent.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/28.
//

import RIBs
import RIBsUtil

final class AppRootComponent: Component<AppRootDependency>, AppHomeDependency , ListHomeDependency, ChooseImageDependency{
    

    lazy var chooseImageBuildable: ChooseImageBuildable = {
        return ChooseImageBuilder(dependency: self)
    }()
    
    
    
    private let rootViewController : ViewControllable

     init(
        dependency: AppRootDependency,
        rootViewController: ViewControllable
    ) {
        self.rootViewController = rootViewController
        super.init(dependency: dependency)
    }
}
