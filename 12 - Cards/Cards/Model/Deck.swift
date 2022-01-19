//
//  Deck.swift
//  Cards
//
//  Created by Natasha Godwin on 1/19/22.
//

import SwiftUI


struct Deck {
	// Tracks the position of a card, as it's moved
	var topCardOffset: CGSize = .zero
	// Stores the card we're moving 
	var activeCard: Card? = nil
	
	var cards = [
		Card(content: "Here's an idea", color: Color.blue),
		Card(content: "Here's another idea", color: Color.yellow),
		Card(content: "Here's a bad idea", color: Color.green),
		Card(content: "Here's a good idea", color: Color.pink)
	]
	
	var count: Int {
		return cards.count
	}
	
	// Return the first index of each card in the array, i.e. its position
	func position(of card: Card) -> Int {
		return cards.firstIndex(of: card) ?? 0
	}
	
	/* The scale of the card depends on its position.
	   The lower the z-index, the further back it is.
	   The further back, the smaller and higher it is.
	 */
	
	// Cards are scaled down by 2% (10 pixels) of their total size, multiplied by their position.
	// A card at index 0 will have a scale of 1 (0 x 0.02)
	func scale(of card: Card) -> CGFloat {
		 let deckPosition = position(of: card)
		 let scale = CGFloat(deckPosition) * 0.02
		 return CGFloat(1 - scale)
	}
	
	// Each card moves down by 10 pixels for every index above one.
	func deckOffset(of card: Card) -> CGFloat {
		 let deckPosition = position(of: card)
		 let offset = deckPosition * 10
		 return CGFloat(offset)
	}
	
	// In SwiftUI, elements with a z-index of 0 are put at the back.
	// We want that card to be on top, since it's first.
	// The z-index is calculated by subtracting each card's position
	// from the number of cards in the deck.
	func zIndex(of card: Card) -> Double {
		return Double(count - position(of: card))
	}
	
	// Returns an angle based on the offset provided 
	func rotation(for card: Card, offset: CGSize = .zero) -> Angle {
		return .degrees(Double(offset.width) / 25.0)
	}
	
	// Removes the card from the array
	// And then adds it to the back
	mutating func moveToBack(_ state: Card) {
		 let topCard = cards.remove(at: position(of: state))
		 cards.append(topCard)
	}
	
	// Removes the card from the array
	// And puts it at the first index
	mutating func moveToFront(_ state: Card) {
		 let topCard = cards.remove(at: position(of: state))
		 cards.insert(topCard, at: 0)
	}
}
