//
//  AlbumHomeViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/21.
//

import RIBs
import RxSwift
import UIKit
import ReactorKit

//MARK: - Action
public enum AlbumAction{
    
}
//MARK: - State
public struct AlbumState {
    
}

//MARK: - Listener
protocol AlbumHomePresentableListener: AnyObject {
//    var action: ActionSubject<AlbumAction> { get }
//    var state: Observable<AlbumState> { get }
}

final class AlbumHomeViewController: BaseViewController, AlbumHomePresentable, AlbumHomeViewControllable {

    weak var listener: AlbumHomePresentableListener?
    
}
