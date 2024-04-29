//
//  CollectionVC.swift
//  MainApp
//
//  Created by Viraj Joshi on 18/04/24.
//

import UIKit

class CollectionVC: UIViewController {

    @IBOutlet weak var myCollectionView: UICollectionView!
    let nameList : [String] = ["Viraj Joshi","Prince Shah","Jay Bhensdadiya","Priyal Shah"]
    var datasourceDelegate: MainDatasourceDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
    }
    
    func setupCollection() {
        if datasourceDelegate == nil {
            datasourceDelegate = .init(arrData: nameList, delegate: self, col: myCollectionView,vc:self)
//            datasourceDelegate = .init(arrData: imageList, delegate: self, col: myCollectionView, vc: self)
        } else {
            datasourceDelegate.reload(arr: nameList)
        }
    }

}

extension CollectionVC: ColViewDelegate {
    func didSelect(colView: UICollectionView, indexPath: IndexPath) {
        
    }
}
