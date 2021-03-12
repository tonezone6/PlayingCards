//
//  CardValue.swift
//  PlayingCards
//
//  Created by Alex Stratu on 10.03.2021.
//

enum CardValue: Hashable {
    case number(Int)
    case ace, jack, king, queen
    
    var symbol: String {
        switch self {
        case .number(let value):
            return "\(value)"
        case .ace:   return "A"
        case .queen: return "Q"
        case .king:  return "K"
        case .jack:  return "J"
        }
    }
}
