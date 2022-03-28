//
//  CameraHomeViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/20.
//

import RIBs
import RxSwift
import UIKit
import AVFoundation


//MARK: - Listener
protocol CameraHomePresentableListener: AnyObject {

    
}

final class CameraHomeViewController: BaseViewController, CameraHomePresentable, CameraHomeViewControllable {

    weak var listener: CameraHomePresentableListener?
    
}
