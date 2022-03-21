//
//  floatyAddBtn.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/16.
//

import UIKit
import Then
import PinLayout
import Floaty


final class floatyAddBtn :  Floaty{
    
    //MARK: - Initalizer
    override init(){
        super.init(frame: .zero)
        setupViews()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    private func setupViews(){
        self.buttonColor = .white
        self.plusColor = .black
        self.buttonShadowColor = .black
        self.openAnimationType = .fade
        self.animationSpeed = 0.02
    }
}
