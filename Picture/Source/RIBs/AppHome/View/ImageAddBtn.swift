//
//  ImageAddBtn.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/16.
//

import UIKit
import Then
import PinLayout

final class ImageAddBtn : UIControl{
    //MARK: - Properties
    private let imageview = UIImageView(image: UIImage(systemName: "plus")).then{
        $0.contentMode = .scaleAspectFit
        $0.tintColor = .white
    }
    //MARK: - Initalizer
    init(){
        super.init(frame: .zero)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    //MARK: - Method
    private func setupViews(){
        addSubviews(imageview)
        
        imageview.pin.center()
    }
}
