//
//  Board.swift
//  SumThing
//
//  Created by Natasha Godwin on 11/23/22.
//

import SwiftUI

/// An enumeration that determines the size of the grid in the game
enum Difficulty: CaseIterable {
	case easy
	case medium
	case hard
	case taxing
	case nightmare

}

class Board: ObservableObject {
	/// A two-dimensional array of integers the user needs to match
	///
	/// This will never change, so it doesn't need to be an @Published property
	var exampleCells = [[Int]]()
	/// A two-dimensional array of integers the user has entered
	@Published var userCells = [[Int]]()
	/// The row the user has selected.
	@Published var selectedRow = 0
	/// The column the user has selected.
	@Published var selectedColumn = 0
	
	/// A method that creates a new game
	/// - Parameter difficulty: the difficulty level the user has selected
	func create(_ difficulty: Difficulty) {
		// Reset
		selectedRow = 0
		selectedColumn = 0
		
		/// The size of the grid
		let size: Int
		/// The size of the array of integers
		let maxNumber: Int
		
		switch difficulty {
		case .easy:
			size = 2
			maxNumber = 4
		case .medium:
			size = 3
			maxNumber = 4
		case .hard:
			size = 4
			maxNumber = 4
		case .taxing:
			size = 5
			maxNumber = 6
		case .nightmare:
			size = 5
			maxNumber = 8
		}
		
		exampleCells = (0..<size).map { _ in
			(0..<size).map { _ in
				Int.random(in: 1...maxNumber)
				
			}
		}
		
		userCells = Array(repeating: Array(repeating: 0, count: size), count: size)
	}
	
	
	init(_ difficulty: Difficulty) {
		create(difficulty)
	}
	
	/// A method that allows users to enter numbers
	///
	/// For better user experience, this method reduces tne number of taps that are needed.
	/// Once a user enters a number, the game will automatically advance to the next cell.
	/// To replace a number, the user can simply enter a new number.
	/// - Parameter number: an integer
	func enter(_ number: Int) {
		if userCells[selectedRow][selectedColumn] == number {
			 userCells[selectedRow][selectedColumn] = 0
		} else {
			 userCells[selectedRow][selectedColumn] = number
			
			if selectedColumn < exampleCells[0].count - 1 {
					  selectedColumn += 1
				 } else {
					  if selectedRow < exampleCells.count - 1 {
							selectedRow += 1
							selectedColumn = 0
					  }
				 }
		}
	}
	
	/// A computed property that verifies the user's total matches the board's total in each row and column
	var isSolved: Bool {
		 for i in 0..<exampleCells.count {
			  let exampleSum = exampleCells[i].reduce(0, +)
			  let userSum = userCells[i].reduce(0, +)
			  if exampleSum != userSum { return false }
		 }

		 for i in 0..<exampleCells[0].count {
			  let exampleSum = exampleCells.reduce(0) { $0 + $1[i] }
			  let userSum = userCells.reduce(0) { $0 + $1[i] }
			  if exampleSum != userSum { return false }
		 }

		 for row in userCells {
			  for column in row {
					if column == 0 { return false }
			  }
		 }

		 return true
	}
	
	/// A method that gives VoiceOver users a hint when entering numbers based on whether they're entering or replacing a number
	/// - Parameter number: the number entered
	/// - Returns: a string
	func hint(for number: Int) -> String {
		 let currentValue = userCells[selectedRow][selectedColumn]

		 if currentValue == number {
			  return "Clear row \(selectedRow + 1) column \(selectedColumn + 1)"
		 } else {
			  return "Set row \(selectedRow + 1) column \(selectedColumn + 1) to \(number)"
		 }
	}
	
	
}
