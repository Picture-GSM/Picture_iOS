//
//  CameraBottomBar.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/01.
//

import UIKit
import RxSwift
import PinLayout

protocol CameraBottomDelegate : AnyObject {
    func didTapAlbumBtn()
    func didTapTakePicture()
}


final class CameraBottomBar : UIView{
    
    var disposeBag = DisposeBag()
    //MARK: - delegate
    public weak var delegate : CameraBottomDelegate?
    
    private let photoLibraryBtn = UIButton().then{
        $0.setImage(UIImage(systemName: "square.grid.2x2.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 27, weight: .semibold)), for: .normal)
        $0.tintColor = .white
    }
    private let takePictureBtn = UIButton().then{
        $0.backgroundColor = .white
        $0.layer.borderColor = UIColor.gray.cgColor
        $0.layer.borderWidth = 4
    }
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setlayout()
        bind()
    }
    //MARK: - required
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setlayout()
        bind()
    }
    //MARK: - Setlayout
    override func layoutSubviews() {
        takePictureBtn.layer.cornerRadius = takePictureBtn.frame.height/2
        takePictureBtn.pin.top(10).hCenter().size(50)
        photoLibraryBtn.pin.top(10).left(20).size(40)
    }
    
    //MARK: - Method
    private func setlayout(){
        backgroundColor = .darkGray
        addSubviews(photoLibraryBtn,takePictureBtn)
    }
    
    //MARK: - Bind
    private func bind(){
        photoLibraryBtn.rx.tap
            .subscribe(onNext:{[weak self] in
                self?.delegate?.didTapAlbumBtn()
            }).disposed(by: disposeBag)
        
        takePictureBtn.rx.tap
            .subscribe(onNext:{ [weak self] in
                self?.delegate?.didTapTakePicture()
            }).disposed(by: disposeBag)
    }
}
