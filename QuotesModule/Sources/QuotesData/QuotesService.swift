//
//  QuoteService.swift
//  QuotesModule
//
//  Created by Azis Ramdhan on 25/05/25.
//

import Foundation
import QuotesCore

public class QuoteService {
    private var quotes: [Quote] = []
    
    public init() {
        loadInitialQuotes()
    }
    
    public func getQuotes() -> [Quote] {
        return quotes
    }
    
    public func add(quote: Quote) {
        quotes.append(quote)
    }
    
    func delete(quote: Quote) {
        quotes.removeAll { $0.id == quote.id }
    }
    
    private func loadInitialQuotes() {
        quotes = [
            Quote(id: "1", text: "Be yourself; everyone else is already taken.", author: "Oscar Wilde"),
            Quote(id: "2", text: "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe.", author: "Albert Einstein"),
            Quote(id: "3", text: "So many books, so little time.", author: "Frank Zappa"),
            Quote(id: "4", text: "Be the change that you wish to see in the world.", author: "Mahatma Gandhi"),
            Quote(id: "5", text: "In three words I can sum up everything I've learned about life: it goes on.", author: "Robert Frost"),
            Quote(id: "6", text: "If you tell the truth, you don't have to remember anything.", author: "Mark Twain"),
            Quote(id: "7", text: "A friend is someone who knows all about you and still loves you.", author: "Elbert Hubbard")
        ]
    }
}

