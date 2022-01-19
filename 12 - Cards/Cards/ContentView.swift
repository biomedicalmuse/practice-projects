//
//  ContentView.swift
//  Cards
//
//  Created by Natasha Godwin on 1/19/22.
//

/*
 Requirements:
 
 1. Cards are ordered sequentially and placed on top of each other.
		- ZStack for layout
		- Array for managing order
		- Deck object for managing state
 2. The top card can be moved around and placed in the front or back of the deck.
		- gesture for movement
		- DragGesture for tracking the card's position
		- onEnded gesture event for resetting deck
 3. When the user swipes a card, it should move to the back and get smaller.
		- offset for card position
		- scale for card size
 
 */

import SwiftUI

struct ContentView: View {
	@State var deck: Deck = Deck()
    var body: some View {
		 ZStack {
			 ForEach(deck.cards) { card in
				 CardView(card: card)
					 .zIndex(deck.zIndex(of: card))
					 .shadow(radius: 2)
					 .offset(
						x: self.offset(for: card).width,
						y: self.offset(for: card).height
					 )
					 .offset(y: deck.deckOffset(of: card))
					 .scaleEffect(
						x: self.deck.scale(of: card),
						y: self.deck.scale(of: card)
					 )
					 .rotationEffect(self.rotation(of: card))
					 .gesture(
						DragGesture()
							.onChanged( { (drag) in
								if self.deck.activeCard == nil {
									self.deck.activeCard = card
								}
								if card != self.deck.activeCard { return }
								
								withAnimation(.spring()) {
									self.deck.topCardOffset = drag.translation
									if
										 drag.translation.width < -200 ||
										 drag.translation.width > 200 ||
										 drag.translation.height < -250 ||
										 drag.translation.height > 250 {
										
										 self.deck.moveToBack(card)
									} else {
										 self.deck.moveToFront(card)
									}
								}
							})
							.onEnded( { (drag) in
								withAnimation(.spring()) {
									self.deck.activeCard = nil
									self.deck.topCardOffset = .zero
								}
							}
							)
					 )
					 
			 }
		 }
    }
	
	// Checks to see whether a card is active and adjusts its offset accordingly.
	func offset(for card: Card) -> CGSize {
		if card != self.deck.activeCard {
			return .zero
		}
		
		return deck.topCardOffset
	}
	
	// Verifies that the card being rotated is active
	// and returns a new angle
	// Otherwise, returns zero 
	func rotation(of card: Card) -> Angle {
		guard let activeCard = self.deck.activeCard else {
			return .degrees(0)
		}
		
		if card != activeCard {
			return .degrees(0)
		}
		
		return deck.rotation(for: activeCard, offset: deck.topCardOffset)
	}
	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
