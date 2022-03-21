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


final class floatyAddBtn : Floaty{
    //MARK: - Properties
    let cameraItem = FloatyItem().then{
        $0.title = "Camera"
        $0.tintColor = .black
        $0.icon = UIImage(systemName: "camera",withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .semibold))
    }
    let albumItem = FloatyItem().then{
        $0.title = "Album"
        $0.tintColor = .black
        $0.icon = UIImage(systemName: "person.2.square.stack",withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .semibold))
    }
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
    //MARK: - SetUp
    private func setupViews(){
        self.buttonColor = .white
        self.plusColor = .black
        self.buttonShadowColor = .black
        self.openAnimationType = .fade
        self.animationSpeed = 0.02
        
        self.addItem(item: cameraItem)
        self.addItem(item: albumItem)
    }
}
