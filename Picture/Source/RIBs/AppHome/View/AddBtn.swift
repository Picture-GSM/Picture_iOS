//
//  floatyAddBtn.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/16.
//

import UIKit
import Then
import PinLayout

final class AddBtn : UIButton{
    //MARK: - Init
    init(){
        super.init(frame: .zero)
        setupViews()
    }
    required init?(coder : NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    //MARK: - Method
    private func setupViews(){
        setImage(UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold)), for: .normal)
        tintColor = .black
        
    }
}
