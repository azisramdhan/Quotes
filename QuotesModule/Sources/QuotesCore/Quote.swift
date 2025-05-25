//
//  Quote.swift
//  QuotesModule
//
//  Created by Azis Ramdhan on 25/05/25.
//

import Foundation

public struct Quote: Hashable, Identifiable, Sendable {
    public let id: String
    public let text: String
    public let author: String
    
    public init(id: String, text: String, author: String) {
        self.id = id
        self.text = text
        self.author = author
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: Quote, rhs: Quote) -> Bool {
        return lhs.id == rhs.id
    }
}
