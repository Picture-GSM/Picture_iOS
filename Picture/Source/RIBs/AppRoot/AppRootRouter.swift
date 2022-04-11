//
//  AppRootRouter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/17.
//

import RIBs
import RIBsUtil
import ListHome


protocol AppRootInteractable: Interactable ,
                                AppHomeListener,
                              ListHomeListener{
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
}

protocol AppRootViewControllable: ViewControllable {
    func setViewControllers(_ viewControllers: [ViewControllable])
}

final class AppRootRouter: LaunchRouter<AppRootInteractable, AppRootViewControllable>, AppRootRouting {
    
    
    private let appHome : AppHomeBuilder
    private let listHome : ListHomeBuilder
    
    init(
        interactor : AppRootInteractor,
        viewController : AppRootViewControllable,
        appHome : AppHomeBuilder,
        listHome : ListHomeBuilder
    ){
        self.appHome = appHome
        self.listHome = listHome
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    //MARK: - Tabbar
    func attachTabs() {
        let appHomeRouting = appHome.build(withListener: interactor)
        let listHomeRouting = listHome.build(withListener: interactor)
        
        attachChild(appHomeRouting)
        attachChild(listHomeRouting)
        
        let viewControllers = [
          NavigationControllerable(root: appHomeRouting.viewControllable),
          NavigationControllerable(root: listHomeRouting.viewControllable),
        ]
        
        viewController.setViewControllers(viewControllers)
    }
}

