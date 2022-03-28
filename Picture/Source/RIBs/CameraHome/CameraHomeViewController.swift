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
import ReactorKit

//MARK: - Action
enum CameraAction{
    
}
//MARK: - State
struct CameraState{
    
}

//MARK: - Listener
protocol CameraHomePresentableListener: AnyObject {
//    var action: ActionSubject<AlbumAction> { get }
//    var state: Observable<AlbumState> { get }
}

final class CameraHomeViewController: BaseViewController, CameraHomePresentable, CameraHomeViewControllable {

    weak var listener: CameraHomePresentableListener?
    
}
