//
//  CardsViewModel.swift
//  PlayingCards
//
//  Created by Alex Stratu on 11.03.2021.
//

import Combine
import CombineExtensions
import Foundation

class CardsViewModel {
    @Published var cards: [CardSection] = []
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        let updated = CardSection(
            title: "Third, cards updated",
            items: CardSection.third.items.filter {
                $0.value == .jack || $0.value == .queen
            }
        )
    
        let response = [
            [.first],
            [.first, .second],
            [.first, .second, .third],
            [.first, .second, updated]
        ]
        
        Timer.publish(every: 1.5, on: RunLoop.main, in: .common)
            .autoconnect()
            .prefix(response.count)
            .scan(0) { (acc, _) in acc + 1 }
            .map { $0 - 1 }
            .map { index in response[index] }
            .weakAssign(to: \.cards, on: self)
            .store(in: &subscriptions)
    }
}
