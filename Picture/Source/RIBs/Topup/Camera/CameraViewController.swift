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
    func didTapTakePicture()
}

final class CameraViewController: BaseViewController, CameraPresentable, CameraViewControllable , CameraBottomDelegate{
    
    weak var listener: CameraPresentableListener?
    
    //MARK: - Properties
    private let cameraToolBar = CameraBottomBar()
    
    //MARK: - Camera Value
    private var session : AVCaptureSession?
    private let output = AVCapturePhotoOutput()
    private let previewLayer = AVCaptureVideoPreviewLayer()
    
    
    //MARK: - Method
    override func configureUI() {
        title = "camera"
        setupNavigationItem(with: .close, target: self, action: #selector(didTapClose))
        checkCameraPermissions()
    }
    override func addView() {
        view.layer.addSublayer(previewLayer)
        view.addSubviews(cameraToolBar)
    }
    override func setLayout() {
        previewLayer.frame = view.bounds
        cameraToolBar.pin.bottom().width(100%).height(81.2)
        
    }
    override func delegate() {
        cameraToolBar.delegate = self
    }
    //MARK: - Camera
    private func checkCameraPermissions(){
        switch AVCaptureDevice.authorizationStatus(for: .video){
        case .notDetermined:
            //request
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard granted else {return }
                DispatchQueue.main.async {
                    self?.setupCamera()
                }
            }
        case .restricted:
            break
        case .denied:
            break
        case .authorized:
            setupCamera()
        @unknown default:
            break
        }
    }
    private func setupCamera(){
        let session = AVCaptureSession()
        if let device = AVCaptureDevice.default(for: .video){
            do{
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input){
                    session.addInput(input)
                }
                if session.canAddOutput(output){
                    session.addOutput(output)
                }
                
                previewLayer.videoGravity = .resizeAspectFill
                previewLayer.session = session
                
                session.startRunning()
                self.session = session
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
    
    
    //MARK: - NavigationAction
    @objc
    private func didTapClose(){
        listener?.didTapCloseBtn()
    }
    

    func didTapTakePicture() {
        output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
        listener?.didTapTakePicture()
    }
}

extension CameraViewController : AVCapturePhotoCaptureDelegate{
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation() else {
            return
        }
        
        print("Fin")
        session?.stopRunning()
    }
}
