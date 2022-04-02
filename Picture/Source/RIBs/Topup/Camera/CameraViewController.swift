//
//  CameraViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RxSwift
import UIKit
import AVFoundation
import PinLayout

protocol CameraPresentableListener: AnyObject {
    func didTapCloseBtn()
    func didTapTransportPhotoLibrary()
    func didTapTakePicture()
}

final class CameraViewController: BaseViewController, CameraPresentable, CameraViewControllable , CameraBottomDelegate{


    weak var listener: CameraPresentableListener?
    
    //MARK: - Properties
    private let cameraToolBar = CameraBottomBar()
    
    
    
    //MARK: - Method
    override func configureUI() {
        title = "camera"
        setupNavigationItem(with: .close, target: self, action: #selector(didTapClose))
    }
    override func addView() {
        view.addSubviews(cameraToolBar)
    }
    override func setLayout() {
        cameraToolBar.pin.bottom().width(100%).height(81.2)
    }
    override func delegate() {
        cameraToolBar.delegate = self
    }
    
    //MARK: - NavigationAction
    @objc
    private func didTapClose(){
        listener?.didTapCloseBtn()
    }
    
    func didTapAlbumBtn() {
        listener?.didTapTransportPhotoLibrary()
    }
    
    func didTapTakePicture() {
        listener?.didTapTakePicture()
    }
}
