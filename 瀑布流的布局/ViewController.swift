//
//  ViewController.swift
//  瀑布流的布局
//
//  Created by Anthony on 2017/4/20.
//  Copyright © 2017年 SLZeng. All rights reserved.
//

import UIKit

private let kContentCellID = "kContentCellID"

class ViewController: UIViewController {
    
    fileprivate lazy var collectionView : UICollectionView = {
        let layout = SLWaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        layout.dataSource = self
        
        let collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        NSLayoutConstraint()
        
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kContentCellID)
    }
    
}


extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kContentCellID, for: indexPath)
        
        cell.backgroundColor = UIColor.randomColor()
        
        return cell
    }
}


extension ViewController : SLWaterfallLayoutDataSource {
    func numberOfCols(_ waterfall: SLWaterfallLayout) -> Int {
        return 4
    }
    
    func waterfall(_ waterfall: SLWaterfallLayout, item: Int) -> CGFloat {
        return CGFloat(arc4random_uniform(150) + 100)
    }
}


