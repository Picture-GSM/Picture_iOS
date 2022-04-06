//
//  ChooseImageViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RxSwift
import UIKit
import Then
import PinLayout
import Photos
import UIUtil

protocol ChooseImagePresentableListener: AnyObject {
    func didTapBack()
}

final class ChooseImageViewController: BaseViewController, ChooseImagePresentable, ChooseImageViewControllable{
    
    weak var listener: ChooseImagePresentableListener?
        
    private var imageSelectStatus : Bool = false
    private let alert = UIAlertController(title: "선택!", message: "이미지 선정 방법을 선택해주세요", preferredStyle: .alert)
    
    private let imagePicker = UIImagePickerController().then{
        $0.allowsEditing = true
    }
    
    private let backButton = UIButton().then {
        $0.backgroundColor = .white
        $0.roundCorners(25)
        $0.tintColor = .black
        $0.setImage(
            UIImage(
                systemName: "chevron.backward",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .semibold)
            ),
            for: .normal
        )
    }
    private let titleLabel = UILabel().then{
        $0.text = "바꾸고 싶은\n사진을 등록해주세요!"
        $0.numberOfLines = 0
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: 22)
    }
    
    private let originalImageBtn = ImageBtn(title: "원본").then{
        $0.backgroundColor = .white
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.layer.applySketchShadow(color: .gray, alpha: 0.4, x: 0, y: 10, blur: 16, spread: 0)
    }
    private let pieceImageBtn = ImageBtn(title: "작품").then{
        $0.backgroundColor = .white
        $0.contentMode = .scaleToFill
        $0.clipsToBounds = true
        $0.layer.applySketchShadow(color: .gray, alpha: 0.4, x: 0, y: 10, blur: 10, spread: 0)
    }
    
    private let startBtn = UIButton().then{
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 20
        $0.setTitle("시작", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
    }

    
    //MARK: - Method
    override func configureUI() {
        alert.addAction(UIAlertAction.init(title: "사진", style: .cancel, handler: { [weak self] _ in
            self?.imagePicker.sourceType = .camera
            self?.imagePicker.cameraDevice = .rear
            self?.imagePicker.cameraCaptureMode = .photo
            DispatchQueue.main.async {
                self?.present(self!.imagePicker, animated: true)
            }
        }))
        alert.addAction(UIAlertAction.init(title: "앨범", style: .destructive, handler: { [weak self] _ in
            self?.imagePicker.sourceType = .photoLibrary
            DispatchQueue.main.async {
                self?.present(self!.imagePicker, animated: true)
            }
        }))
    }
    
    override func addView() {
        view.addSubviews(backButton,titleLabel,originalImageBtn,pieceImageBtn,startBtn)
    }
    
    override func setLayout() {
        backButton.pin.top(view.pin.safeArea.top + 5).size(40).left(20)
        titleLabel.pin.below(of: backButton, aligned: .start).right(view.pin.safeArea).marginHorizontal(0).height(100)
        originalImageBtn.pin.size(bounds.width/2.5).centerLeft(20)
        pieceImageBtn.pin.size(bounds.width/2.5).centerRight(20)
        startBtn.pin.bottom(bounds.height/15).hCenter().width(80%).maxWidth(300).height(40)
    }
    
    override func delegate() {
        imagePicker.delegate = self
    }
 
        
    //MARK: - Bind
    override func bindView() {
        backButton.rx.tap
            .subscribe(onNext:{[weak self] in
                self?.listener?.didTapBack()
            })
            .disposed(by: disposeBag)
        
        originalImageBtn.rx.tap
            .subscribe(onNext:{ [weak self] in
                self?.imageSelectStatus = true
                self?.present(self!.alert, animated: true)
            }).disposed(by: disposeBag)
        
        pieceImageBtn.rx.tap
            .subscribe(onNext:{ [weak self] in
                self?.imageSelectStatus = false
                self?.present(self!.alert, animated: true)
            }).disposed(by: disposeBag)
    }
}

extension ChooseImageViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var image : UIImage? = nil

        if let possibleimage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            image = possibleimage
        }else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = possibleImage
        }

        if imageSelectStatus{
            originalImageBtn.setImage(image, for: .normal)
        }else{
            pieceImageBtn.setImage(image, for: .normal)
        }
        self.dismiss(animated: true)
    }
}
