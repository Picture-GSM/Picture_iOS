//
//  AlbumHomeViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/21.
//

import RIBs
import RxSwift
import UIKit

//MARK: - Listener
protocol AlbumHomePresentableListener: AnyObject {

    
}

final class AlbumHomeViewController: BaseViewController, AlbumHomePresentable, AlbumHomeViewControllable {

    weak var listener: AlbumHomePresentableListener?
    
    override func configureUI() {
        title = "Album"
        
    }
}
