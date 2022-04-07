//
//  ListHomeViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/17.
//

import RIBs
import RxSwift
import UIKit
import PinLayout
import RxDataSources
import RealmSwift
import RxRealm

protocol ListHomePresentableListener: AnyObject {

}

final class ListHomeViewController: BaseViewController, ListHomePresentable, ListHomeViewControllable {
    
    //MARK: - Listener
    weak var listener: ListHomePresentableListener?
    
    //MARK: - Properties
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        let layout = UICollectionViewFlowLayout()
        $0.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: "List")
        $0.collectionViewLayout = layout
        $0.backgroundColor = .red
    }
    
    
    //MARK: - initalizer
    override func configureUI() {
        title = "List"
        tabBarItem = UITabBarItem(title: "목록",image: UIImage(systemName: "doc"),selectedImage: UIImage(systemName: "doc.fill"))
    }
    //MARK: - addView
    override func addView() {
        view.addSubview(collectionView)
    }
    //MARK: - delegate
    override func delegate() {
        collectionView.rx.setDelegate(self).disposed(by: disposeBag)
        collectionView.rx.setDataSource(self).disposed(by: disposeBag)
    }
    
    //MARK: - Setlayout
    override func setLayout() {
        collectionView.pin.all(view.pin.safeArea)
    }
    
    //MARK: - Bind
    override func bindView() {
        
    }
    override func bindAction() {

    }
}
extension ListHomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "List", for: indexPath) as? ListCollectionViewCell else {return UICollectionViewCell()}
        return cell
    }
    
    
}
