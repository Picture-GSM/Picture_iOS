//
//  CameraBottomBar.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/01.
//

import UIKit
import RxSwift

protocol CameraBottomDelegate : AnyObject {
    func didTapAlbumBtn()
    func didTapTakePicture()
}


final class CameraBottomBar : UIView{
    
    var disposeBag = DisposeBag()
    //MARK: - delegate
    weak var delegate : CameraBottomDelegate?
    
    private let photoLibraryBtn = UIButton().then{
        $0.setImage(UIImage(systemName: "square.grid.2x2.fill",withConfiguration: UIImage.SymbolConfiguration(pointSize: 27, weight: .semibold)), for: .normal)
        $0.tintColor = .white
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
    private func setlayout(){
        backgroundColor = .darkGray
        addSubviews(photoLibraryBtn)
        
        photoLibraryBtn.pin.left(20).hCenter().size(40)
    }
    
    //MARK: - Bind
    private func bind(){
        photoLibraryBtn.rx.tap
            .subscribe(onNext:{[weak self] in
                self?.delegate?.didTapAlbumBtn()
            }).disposed(by: disposeBag)
        
    }
    
}
