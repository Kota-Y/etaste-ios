//
//  ItemCellLayout.swift
//  ETASTE
//
//  Created by hakuchan on 2019/08/19.
//  Copyright © 2019 ETASTE. All rights reserved.
//

import UIKit

class ItemCellLayout: UICollectionViewLayout {
    weak var delegate: CustomDelegate!
    
    var attributesArray = [UICollectionViewLayoutAttributes]()
    var numColumns = 1
    var padding: CGFloat = 10
    var contentHeight: CGFloat = 280
    var contentWidth: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        return collectionView.bounds.width
    }
    
   
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
override func prepare() {
    
        guard attributesArray.isEmpty, let collectionView = collectionView else { return }

        let columnWidth = CGFloat(280)
        var column = 0
        let xoff = (contentWidth - 280) / 2.0
        var yOffsets = [CGFloat]()
    
        for column in 0..<numColumns {
        yOffsets.append(columnWidth * CGFloat(column) + 10)
    }
        for item in 0..<collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: item, section: 0)
            let itemHeight = delegate.collectionView(collectionView, heightForItemAt: indexPath)
           
            let height = itemHeight + padding * 2
            let frame = CGRect(x: CGFloat(xoff), y: yOffsets[column], width: columnWidth, height: height)
            let insetFrame = frame.insetBy(dx: padding, dy: padding)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            attributesArray.append(attributes)

            contentHeight = max(contentHeight, frame.maxY)

            yOffsets[column] = yOffsets[column] + height
            column = column < (numColumns - 1) ? (column + 1) : 0
        }
}

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()

        for attributes in attributesArray {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
}
    
protocol CustomDelegate: class {
    func collectionView(_ collectionView: UICollectionView, heightForItemAt indexPath: IndexPath) -> CGFloat
}

