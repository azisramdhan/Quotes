// Quote.swift
import Foundation

struct Quote: Hashable, Identifiable {
    let id: String
    let text: String
    let author: String
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Quote, rhs: Quote) -> Bool {
        return lhs.id == rhs.id
    }
}
