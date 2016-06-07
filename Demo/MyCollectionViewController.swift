//
//  MyCollectionViewController.swift
//  Demo
//
//  Created by Mystore on 07/06/16.
//  Copyright © 2016 Lars-Jørgen Kristiansen. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

final class MyCollectionViewController: UICollectionViewController {

    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        if newCollection.horizontalSizeClass != traitCollection.horizontalSizeClass {
            self.collectionView?.reloadData()
        }
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        switch traitCollection.horizontalSizeClass {
        case .Compact:
            cell.stackView.axis = .Horizontal
        default:
            cell.stackView.axis = .Vertical
        }
        
        return cell
    }

}
