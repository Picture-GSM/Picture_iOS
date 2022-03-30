//
//  AlbumHomeViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/21.
//

import RIBs
import RxSwift
import UIKit
import Then
import PinLayout
import RxDataSources
import Photos
import Reusable

//MARK: - Listener
protocol AlbumHomePresentableListener: AnyObject {
    func didTapBackButton()
    
}

final class AlbumHomeViewController: BaseViewController, AlbumHomePresentable, AlbumHomeViewControllable{

    weak var listener: AlbumHomePresentableListener?
    
    //MARK: - Main
    override func configureUI() {
        title = "Album"
        setupNavigationItem(with: .back, target: self, action: #selector(backbuttonAction))
    }


    //MARK: - Selector
    @objc
    private func backbuttonAction(){
        listener?.didTapBackButton()
    }
    
}



