//
//  ImageBtn.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import UIKit

class ImageBtn : UIButton{
    
    private let title : String
    //MARK: - Init
    init(title : String){
        
        self.title = title
        super.init(frame: .zero)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupLayout(){
        setTitle(title, for: .normal)
        setTitleColor( .black, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.layer.cornerRadius = 20
    }
    
}
