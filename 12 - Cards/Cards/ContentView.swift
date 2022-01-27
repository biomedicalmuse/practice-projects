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
 4. When the user moves a card to the top of the screen, it will be removed from the deck and placed at the top of the screen in a horizontal row (and vice versa).
 5.
 
 */

import SwiftUI

struct ContentView: View {
	@State var deck: Deck = Deck()
	@State var showingDeleteButton = false
    var body: some View {
		 VStack {
			 if !deck.selectedCards.isEmpty {
				 ScrollView(.horizontal) {
					 HStack {
						 ForEach(deck.selectedCards) { selected in
							 CardView(card: selected)
								 .padding(0)
								 .scaleEffect(
									x: self.deck.scale(of: selected) * 0.40,
									y: self.deck.scale(of: selected) * 0.40
								 )
								 .frame(width: 140, height: 140)
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
			 if deck.cards.isEmpty {
				 Spacer()
				 Text("You don't have any cards.")
					 .foregroundColor(.secondary)
			 }
				Spacer()
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
									
									if drag.translation.height < -200 {
											self.deck.select(card)
									}
									
									if drag.translation.height > 100  {
										showingDeleteButton = true
									} else {
										showingDeleteButton = false
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
			   Spacer()
			  if showingDeleteButton == true {
				 Button(action:  {
					 /*
					  WORKAROUND
					  
					  The delete button only appears when users drag
					  the top card to the bottom of the screen.
					  
					  So, we can use the removeFirst() method here
					  to delete it from the deck.
					  
					  This solution isn't ideal because it will only
					  work with this particular design.
					  
					  But it'll do for now.
					  */
					 deck.cards.removeFirst()
				 }) {
					 Label("Delete", systemImage: "trash")
						 .frame(width: 110, height: 30)
						 .foregroundColor(Color.white)
						 .background(Color.red.opacity(0.7))
						 .clipShape(RoundedRectangle(cornerRadius: 50.0))
						 .padding()
				 }
			 }
		 }
    }
	
	// Checks to see whether a card is active and adjusts its offset accordingly.
	func offset(for card: Card) -> CGSize {
		if card != self.deck.activeCard {
			return .zero
		}
		
		return self.deck.topCardOffset
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
