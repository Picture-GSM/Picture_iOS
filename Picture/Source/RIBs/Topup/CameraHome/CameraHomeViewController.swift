//
//  CameraHomeViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/20.
//

import RIBs
import RxSwift

import UIKit
import Then
import AVFoundation

//MARK: - Listener
protocol CameraHomePresentableListener: AnyObject {
    
    
}

final class CameraHomeViewController: BaseViewController, CameraHomePresentable, CameraHomeViewControllable {

    weak var listener: CameraHomePresentableListener?
    
    var backFacingCamera : AVCaptureDevice?
    var frontFacingCamera : AVCaptureDevice?
    

    //MARK: - Main
    override func configureUI() {
        title = "Camera"
        
    }
    
    //MARK: - AddView
    override func addView() {
    }
    
    //MARK: - Setlayout
    override func setLayout() {
    }
}

