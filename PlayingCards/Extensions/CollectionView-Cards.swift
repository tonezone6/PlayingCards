//
//  CollectionView+Cells.swift
//  PlayingCards
//
//  Created by Alex Stratu on 10.03.2021.
//

import UIKit

extension UICollectionView {
    
    func registerCardsCells() {
        register(CardCell.self, forCellWithReuseIdentifier: CardCell.id)
        register(CardsHeaderView.self,
                 forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                 withReuseIdentifier: CardsHeaderView.id)
    }
    
    func supplementaryView(of kind: String, for indexPath: IndexPath) -> CardsHeaderView {
        guard let header = dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: CardsHeaderView.id, for: indexPath) as? CardsHeaderView
        else {
            fatalError("cannot dequeue cards view supplementary view")
        }
        return header
    }
    
    func cell(for indexPath: IndexPath) -> CardCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: CardCell.id, for: indexPath) as? CardCell
        else {
            fatalError("cannot dequeue card cell")
        }
        return cell
    }
    
    typealias CardsDataSource = UICollectionViewDiffableDataSource<CardSection, Card>
    
    var cardCellProvider: CardsDataSource.CellProvider {
        { (collectionView, indexPath, card) in
            let cell = collectionView.cell(for: indexPath)
            cell.label.text = card.text
            cell.label.textColor = card.isRed ? .red : .label
            return cell
        }
    }
    
    var cardsHeaderProvider: CardsDataSource.SupplementaryViewProvider? {
        { (collectionView, kind, indexPath) in
            guard let dataSource = collectionView.dataSource as? CardsDataSource
            else { return nil }
            
            let sections = dataSource.snapshot().sectionIdentifiers
            let section = sections[indexPath.section]
            let title = section.title
            
            let header = collectionView.supplementaryView(of: kind, for: indexPath)
            header.label.text = title
            return header
        }
    }
}
