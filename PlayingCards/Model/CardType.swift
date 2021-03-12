//
//  CardType.swift
//  PlayingCards
//
//  Created by Alex Stratu on 10.03.2021.
//

enum CardType: Hashable {
    case club, diamond, heart, spade
    
    var symbol: String {
        switch self {
        case .club:    return "♣️"
        case .diamond: return "♦️"
        case .heart:   return "❤️"
        case .spade:   return "♠️"
        }
    }
}
