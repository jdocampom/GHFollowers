//
//  UIHelpers.swift
//  GHFollowers
//
//  Created by Juan Diego Ocampo on 14/08/2022.
//

import UIKit

final class UIHelpers {
    
    static func createThreeColumnFlowLayout(from view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding = CGFloat(12)
        let minimumItemSpacing = CGFloat(10)
        let availableWidth = width - (padding * 2) - (minimumItemSpacing * 2)
        let itemWidth = availableWidth / 3
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        return flowLayout
    }
    
}
