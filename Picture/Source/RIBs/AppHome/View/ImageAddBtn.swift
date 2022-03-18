//
//  ImageAddBtn.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/16.
//

import UIKit
import Then
import PinLayout

final class ImageAddBtn : UIButton{
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
        setImage(UIImage(systemName: "plus",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold)), for: .normal)
        tintColor = .black
    }
}
