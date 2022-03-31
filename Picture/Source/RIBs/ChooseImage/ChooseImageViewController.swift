//
//  ChooseImageViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs
import RxSwift
import UIKit
import Then

protocol ChooseImagePresentableListener: AnyObject {
    func didTapBack()
}

final class ChooseImageViewController: BaseViewController, ChooseImagePresentable, ChooseImageViewControllable {
    
    weak var listener: ChooseImagePresentableListener?
    
    private let backButton = UIButton().then {
        $0.backgroundColor = .white
        $0.roundCorners(25)
        $0.tintColor = .black
        $0.setImage(
            UIImage(
                systemName: "chevron.backward",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 20, weight: .semibold)
            ),
            for: .normal
        )
    }
    
    override func addView() {
        view.addSubviews(backButton)
    }
    override func setLayout() {
        backButton.pin.top(40).size(40).left(20).top(40)
    }
    
    //MARK: - Bind
    override func bindView() {
        backButton.rx.tap
            .subscribe(onNext:{[weak self] in
                self?.listener?.didTapBack()
            })
            .disposed(by: disposeBag)
    }
    
}
