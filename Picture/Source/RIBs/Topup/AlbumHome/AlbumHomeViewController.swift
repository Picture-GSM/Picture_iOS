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
        
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        let layout = UICollectionViewFlowLayout()
        $0.collectionViewLayout = layout
        $0.register(cellType: AlbumCollectionViewCell.self)
    }
    
    //MARK: - Main
    override func configureUI() {
        title = "Album"
        setupNavigationItem(with: .back, target: self, action: #selector(backbuttonAction))
    }
    override func addView() {
        view.addSubviews(collectionView)
    }
    override func setLayout() {
        collectionView.pin.all()
    }
    override func delegate() {
        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)

        collectionView.rx.setDataSource(self)
            .disposed(by: disposeBag)
    }
    //MARK: - Selector
    @objc
    private func backbuttonAction(){
        listener?.didTapBackButton()
    }
    
}

extension AlbumHomeViewController : UICollectionViewDelegate, UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photocount
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as AlbumCollectionViewCell
        let assert = allphotos?.object(at: indexPath.row)
        cell.iv.fetchImage(asset: assert!, contentMode: .aspectFit, targetSize: cell.iv.frame.size)
        return cell
    }
}


