//
//  AppDelegate.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/10.
//

import UIKit
import RIBs
import Photos

var allphotos : PHFetchResult<PHAsset>? = nil
var photocount = Int()

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private var launchRouter : LaunchRouting?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let result = AppRootBuilder(dependency: AppComponent()).build()
        self.launchRouter = result
        //MARK: - Image Setting
        imagepickerSetting()
        
        result.launch(from: window)
        
        return true
    }
    
    private func imagepickerSetting(){
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status{
            case .authorized:
                print("Good to Proceed")
                let fetchOptions = PHFetchOptions()
                allphotos = PHAsset.fetchAssets(with: .image, options: fetchOptions)
                photocount = allphotos?.count ?? 0
                print(photocount)
            case.denied,.restricted:
                print("Not alloed")
            case .notDetermined:
                print("Not determinded yet")
            case .limited:
                print("Limited")
            @unknown default:
                print("error")
            }
        }
    }
    
}

