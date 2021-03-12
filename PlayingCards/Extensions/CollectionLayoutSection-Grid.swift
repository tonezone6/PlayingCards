//
//  CollectionLayoutSection-Grid.swift
//  PCards
//
//  Created by Alex Stratu on 09.03.2021.
//

import UIKit

extension NSCollectionLayoutSection {
    
    static func grid(
        columns: Int,
        heightRatio: CGFloat = 1, // 1 = square
        interItemSpacing: CGFloat = 8,
        interGroupSpacing: CGFloat = 8,
        edgeSpacing: CGFloat = 16) -> NSCollectionLayoutSection {
        
        // Item.
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group.
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1/CGFloat(columns) * heightRatio)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitem: item,
            count: columns
        )
        group.interItemSpacing = .fixed(interItemSpacing)
        
        // Section.
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = interGroupSpacing
        
        section.contentInsets = NSDirectionalEdgeInsets(
            top: interItemSpacing, leading: edgeSpacing,
            bottom: edgeSpacing, trailing: edgeSpacing
        )
        return section
    }
}

extension NSCollectionLayoutBoundarySupplementaryItem {
    
    static var headerElement: NSCollectionLayoutBoundarySupplementaryItem {
        let size = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(44)
        )
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: size,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        return header
    }
}
