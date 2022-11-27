//
//  ContentView.swift
//  CalculatorGame
//
//  Created by Natasha Godwin on 11/27/22.
//

import SwiftUI
import SpriteKit
import Combine

/*
 THE GAME
 
 The goal of this game is to make numbers on the screen disappear by tapping them. As one disappears, more appear. If ten appear on the screen, it's game over.
 */

struct ContentView: View {
	let columns = [
	  GridItem(.fixed(64)),
	  GridItem(.fixed(64)),
	  GridItem(.fixed(64))
	]
	
	@State var text: String = ""
	@State var timer: Timer!
	@State var speeder: TimeInterval = 1
	@State var gameOver: Color = Color.black
	@State var gameSet: String = "Reset"
	
    var body: some View {
		 VStack {
			 VStack {
				 Text(text)
					 .font(.headline)
					 .foregroundColor(gameOver)
					 .onReceive(mySignal) { (value) in
						 text = text.replacingOccurrences(of: value, with: "")
						 if text.count == 0 {
							 timer.invalidate()
							 speeder = speeder / 2
							 growMore()
						 }
					 }
					 .onAppear {
						 growMore()
					 }
					 .onTapGesture {
						 gameSet = "reset"
					 }
			 }
			 LazyVGrid(columns: columns, spacing: 2) {
				 ForEach(1...9, id: \.self) {
					 BoxView(index: $0, color: UIColor.yellow)
				 }
			 }
			 Text(gameSet)
				 .font(.headline)
				 .onTapGesture {
					 text = ""
					 speeder = 1
					 gameOver = Color.black
					 growMore()
				 }
		 }
    }
	
	func growMore() {
		timer = Timer.scheduledTimer(withTimeInterval: speeder, repeats: true) { timer in
			let nextCharacter = String(UnicodeScalar(Int.random(in: 49...57))!)
			if text.count < 10 {
				text = text + nextCharacter
			} else {
				gameOver = Color.red
				gameSet = "Game Over!"
				timer.invalidate()
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
