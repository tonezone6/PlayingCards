//
//  Section.swift
//  PCards
//
//  Created by Alex Stratu on 10.03.2021.
//

import CombineExtensions

struct CardSection: Section {
    let title: String?
    let items: [Card]
}

extension CardSection {
    
    static var first: CardSection {
        .init(
            title: "First",
            items: [
                .init(value: .number(10), type: .club),
                .init(value: .number(9), type: .heart),
                .init(value: .number(8), type: .diamond),
                .init(value: .number(7), type: .heart),
                .init(value: .number(6), type: .club)
        ])
    }
    
    static var second: CardSection {
        .init(
            title: "Second",
            items: [
                .init(value: .number(9), type: .spade),
                .init(value: .number(8), type: .heart),
                .init(value: .number(7), type: .club)
        ])
    }
    
    static var third: CardSection {
        .init(
            title: "Third",
            items: [
                .init(value: .ace, type: .heart),
                .init(value: .jack, type: .heart),
                .init(value: .queen, type: .heart),
                .init(value: .king, type: .diamond),
                
                .init(value: .ace, type: .club),
                .init(value: .jack, type: .club),
                .init(value: .queen, type: .diamond),
                .init(value: .king, type: .heart),
                
                .init(value: .ace, type: .diamond),
                .init(value: .jack, type: .spade),
                .init(value: .queen, type: .spade),
                .init(value: .king, type: .spade),
                
                .init(value: .ace, type: .spade),
                .init(value: .jack, type: .diamond),
                .init(value: .queen, type: .club),
                .init(value: .king, type: .club)
        ])
    }
}



