//
//  CameraCaptureDelegate.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/06.
//

import Foundation
import AVFoundation
import UIKit

//MARK: - CameraCaptureDelegate
protocol CameraCaptureDelegate: AnyObject{
    func cameraCaptureDone(_ image : UIImage) -> UIImage
}
//MARK: - Camera Setting
protocol CameraCaptureSettingDelegate : AnyObject{
    func checkCameraPermissions()
    func setupCamera()
    func cameraCaptureDelegate()
}

final class CameraCaptureDelegateProxy : NSObject, AVCapturePhotoCaptureDelegate, CameraCaptureSettingDelegate{
    
    public weak var delegate : CameraCaptureDelegate?
    
    private var session : AVCaptureSession?
    private let output = AVCapturePhotoOutput()
    private let previewLayer = AVCaptureVideoPreviewLayer()
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let data = photo.fileDataRepresentation() else {
            return
        }
        
        delegate?.cameraCaptureDone(UIImage(data: data) ?? UIImage())
        
    }
    
    func checkCameraPermissions() {
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
    
    func setupCamera() {
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
    //MARK: - Delegate
    func cameraCaptureDelegate() {
        output.capturePhoto(with: AVCapturePhotoSettings(), delegate: self)
    }
}
