//
//  ViewController.swift
//  PCards
//
//  Created by Alex Stratu on 09.03.2021.
//

import Combine
import UIKit

class CardsViewController: UICollectionViewController {
    
    let viewModel: CardsViewModel
    var subscription: Cancellable?

    init(viewModel: CardsViewModel) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: .cards)
        collectionView.backgroundColor = .systemGroupedBackground
        collectionView.registerCardsCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subscription = viewModel.$cards.assign(
            to: collectionView,
            cellProvider: collectionView.cardCellProvider,
            supplementaryViewProvider: collectionView.cardsHeaderProvider)
    }
}

extension UICollectionViewLayout {
    
    static var cards: UICollectionViewCompositionalLayout {
        let section: NSCollectionLayoutSection = .grid(columns: 5, heightRatio: 1.3)
        section.boundarySupplementaryItems = [.headerElement]
        return UICollectionViewCompositionalLayout(section: section)
    }
}
