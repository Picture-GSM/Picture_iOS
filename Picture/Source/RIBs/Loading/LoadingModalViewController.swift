//
//  LoadingModalViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import RIBs
import RxSwift
import UIKit
import PinLayout
import NVActivityIndicatorView

protocol LoadingModalPresentableListener: AnyObject {
    func didClearTrainingMachine(_ image : UIImage)
}

final class LoadingModalViewController: BaseViewController, LoadingModalPresentable, LoadingModalViewControllable {


    weak var listener: LoadingModalPresentableListener?
    
    private var originerImage : UIImage = .init()
    private var pieceImage : UIImage = .init()
    
    private let bgView = UIView().then{
        $0.backgroundColor = .darkGray
        $0.layer.cornerRadius = 20
    }
    private lazy var activityIndicator = NVActivityIndicatorView(
        frame: CGRect(x: 0, y: 0, width: 70, height: 70),
        type: .orbit,
        color: .systemBlue,
        padding: .zero
    )
    private let label = UILabel().then{
        $0.text = "Loading.."
        $0.font = UIFont.systemFont(ofSize: 20)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    override func configureUI() {
        view.backgroundColor = .black.withAlphaComponent(0.1)
        activityIndicator.startAnimating()
        
        test()
    }
    override func addView() {
        view.addSubview(bgView)
        bgView.addSubviews(activityIndicator,label)
    }
    
    override func setLayout() {
        bgView.pin.center().size(bounds.width/1.85)
        activityIndicator.pin.top(bounds.height/20).hCenter()
        label.pin.bottomCenter(bounds.height/20).width(bgView.frame.width).height(20)
    }
    
    private func test(){
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.listener?.didClearTrainingMachine(self.originerImage)
            self.activityIndicator.stopAnimating()
        }
    }
    
    //MARK: - Listener
    func update(origin originerImage: UIImage, piece pieceImage: UIImage) {
        self.originerImage = originerImage
        self.pieceImage = pieceImage
    }
    
}
