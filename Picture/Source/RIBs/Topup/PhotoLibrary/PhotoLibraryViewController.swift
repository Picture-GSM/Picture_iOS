//
//  PhotoLibraryViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RxSwift
import UIKit

protocol PhotoLibraryPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class PhotoLibraryViewController: UIViewController, PhotoLibraryPresentable, PhotoLibraryViewControllable {
    
    weak var listener: PhotoLibraryPresentableListener?
    
    private let disposeBag = DisposeBag()
    
    fileprivate let selectedPhotoSubject = PublishSubject<UIImage>()
    
    
    
}
