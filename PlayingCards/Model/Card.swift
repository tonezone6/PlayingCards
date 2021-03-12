

struct Card: Hashable, Identifiable {
    let value: CardValue
    let type: CardType
    
    var text: String {
        value.symbol + type.symbol
    }
    
    var isRed: Bool {
        type == .diamond || type == .heart
    }
    
    var id: String { text }
}

extension Card: Equatable {
    public static func == (lhs: Card, rhs: Card) -> Bool {
        (lhs.value.symbol == rhs.value.symbol) &&
        (lhs.type.symbol == rhs.type.symbol)
    }
}
