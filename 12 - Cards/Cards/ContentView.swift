//
//  ContentView.swift
//  Cards
//
//  Created by Natasha Godwin on 1/19/22.
//

/*
 
 1. Cards are ordered sequentially and placed on top of each other.
		- ZStack for layout
		- Array for managing order
		- Deck object for managing state
 2. The top card can be moved around and placed in the front or back of the deck.
		- gesture for movement
		- DragGesture for tracking the card's position
		- onEnded gesture event for resetting deck
 3. When the user swipes a card to the left or right, it should move to the back and get smaller.
		- offset for card position
		- scale for card size
 4. When the user moves a card to the top of the screen, it will be removed from the deck and placed at the top of the screen in a horizontal row.
 
 */

import SwiftUI

struct ContentView: View {
	@State var deck: Deck = Deck()
    var body: some View {
		 VStack {
			 // Annotated Cards
			 if !deck.selectedCards.isEmpty {
				 ScrollView(.horizontal) {
					 HStack {
						 ForEach(deck.selectedCards) { selected in
							 CardView(card: selected)
								 .scaleEffect(
									x: self.deck.scale(of: selected) * 0.50,
									y: self.deck.scale(of: selected) * 0.50
								 )
								 .padding(0)
								 .frame(width: 150, height: 200)
								 .gesture (
									DragGesture()
										.onChanged( { (drag) in
											if self.deck.activeCard == nil {
												self.deck.activeCard = selected
											}
											if selected != self.deck.activeCard { return }
											
											withAnimation(.spring()) {
												self.deck.topCardOffset = drag.translation
												
												if drag.translation.height > 100 && !deck.cards.contains(selected) {
													self.deck.unselect(selected)
													self.deck.moveToFront(selected)
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
				 Divider()
			 }
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
											 drag.translation.width > 200
										{
											
											 self.deck.moveToBack(card)
										} else {
											 self.deck.moveToFront(card)
										}
									}
									
									if drag.translation.height < -250 {
											self.deck.select(card)
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
