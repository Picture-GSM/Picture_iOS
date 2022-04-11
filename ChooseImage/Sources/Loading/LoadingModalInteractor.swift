//
//  LoadingModalInteractor.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import RIBs
import RxSwift
import UIKit

protocol LoadingModalRouting: ViewableRouting {

}

protocol LoadingModalPresentable: Presentable {
    var listener: LoadingModalPresentableListener? { get set }
    
    func update(origin originerImage : UIImage, piece pieceImage : UIImage)
}

public protocol LoadingModalListener: AnyObject {
    func didClearTrainingMachine(image : UIImage)
}

final class LoadingModalInteractor: PresentableInteractor<LoadingModalPresentable>, LoadingModalInteractable, LoadingModalPresentableListener {


    weak var router: LoadingModalRouting?
    weak var listener: LoadingModalListener?

    private let originerImage : UIImage
    private let pieceImage : UIImage
    
    init(
        presenter: LoadingModalPresentable,
        originerImage : UIImage,
        pieceImage : UIImage
    ) {
        self.originerImage = originerImage
        self.pieceImage = pieceImage
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()

        presenter.update(origin: originerImage, piece: pieceImage)
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
    
    func didClearTrainingMachine(_ image: UIImage) {
        listener?.didClearTrainingMachine(image: image)
    }
    
}
