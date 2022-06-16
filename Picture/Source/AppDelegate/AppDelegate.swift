//
//  AppDelegate.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/10.
//

import UIKit
import RIBs
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate  {

    var window: UIWindow?
    
    static let countainer : Container = {
        let container = Container()
        container.register(AppComponent.self) { _ in AppComponent()}
        
        container.register(AppRootBuilder.self) { resolver in
            let result = AppRootBuilder(dependency: resolver.resolve(AppComponent.self)!)
            return result
        }
        return container
    }()
    
    private var launchRouter : LaunchRouting?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let result = AppDelegate.countainer.resolve(AppRootBuilder.self)?.build()
        self.launchRouter = result
        //MARK: - Image Setting
        result?.launch(from: window)
        return true
    }
    
}

