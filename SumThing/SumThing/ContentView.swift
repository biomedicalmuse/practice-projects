//
//  ContentView.swift
//  SumThing
//
//  Created by Natasha Godwin on 11/23/22.
//

import SwiftUI

struct ContentView: View {
	@StateObject private var board = Board(.medium)
	@State private var isGameOver = false
	var body: some View {
		NavigationStack {
			VStack {
				Spacer()
				
				Grid(horizontalSpacing: 2, verticalSpacing: 2) {
					ForEach(0..<board.exampleCells.count, id: \.self) { row in
						GridRow {
							let userRow = board.userCells[row]
							let exampleRow = board.exampleCells[row]
							
							
							ForEach(0..<userRow.count, id: \.self) { column in
								let selected = row == board.selectedRow && column == board.selectedColumn
								// Reads out the values the user enters on VoiceOver
								let userValue = userRow[column] == 0 ? "" : String(userRow[column])
								
								CellView(number: userRow[column], isSelected: selected) {
									board.selectedRow = row
									board.selectedColumn = column
								}
								.accessibilityValue(userValue)
								.accessibilityLabel("Row \(row) column \(column)")
								.accessibilityAddTraits(selected ? .isSelected : .isButton)
							}
							
							// The number needed the user should get for each row
							let exampleSum = sum(forRow: exampleRow)
							let userSum = sum(forRow: userRow)
							
							SumView(number: exampleSum)
								.foregroundColor(exampleSum == userSum ? .primary : .red)
								.accessibilityLabel("Row \(row + 1) sum: \(exampleSum)")
								.accessibilityHint(exampleSum == userSum ? "Correct" : "Incorrect")
						}
					}
					
					// The number the user should get for each column
					GridRow {
						ForEach(0..<board.exampleCells[0].count, id: \.self) { column in
							let exampleSum = sum(forColumn: column, in: board.exampleCells)
							let userSum = sum(forColumn: column, in: board.userCells)
							
							SumView(number: exampleSum)
								.foregroundColor(exampleSum == userSum ? .primary : .red)
								.accessibilityLabel("Column \(column + 1) sum: \(exampleSum)")
									 .accessibilityHint(exampleSum == userSum ? "Correct" : "Incorrect")
							
						}
					}
				}
				.padding(.horizontal)
				
				Spacer()
				
				HStack {
					 ForEach(1..<10) { i in
						  Button(String(i)) {
								board.enter(i)
						  }
						  .accessibilityLabel("Enter \(i)")
						  .accessibilityHint(board.hint(for: i))
						  .frame(maxWidth: .infinity)
						  .font(.largeTitle)
					 }
				}
				.padding()
				
				// Submit your response
				Button("Submit") {
					isGameOver = true
				}
				.buttonStyle(.borderedProminent)
				.disabled(board.isSolved == false)

				Spacer()
				
			}
			.navigationTitle("SumThing")
			.toolbar {
				Button {
					isGameOver = true
				} label: {
					Label("Start a new game", systemImage: "plus")
				}
			}
			.alert("New Game", isPresented: $isGameOver) {
				 ForEach(Difficulty.allCases, id: \.self) { difficulty in
					  Button(String(describing: difficulty).capitalized) {
							startGame(difficulty)
					  }

					  Button("Cancel", role: .cancel) { }
				 }
			} message: {
				if board.isSolved {
					Text("You solved it! Nice work!")
				}
			}
			.dynamicTypeSize(...DynamicTypeSize.xxxLarge) // cap the maximum font size, so the game looks good on older phones
			
		}
	}
	
	/// A method that adds up all of the numbers in a single row
	/// - Parameter row: a single row
	/// - Returns: an integer
	func sum(forRow row: [Int]) -> Int {
		row.reduce(0, +)
	}
	
	/// A method that adds up all of the numbers in a single column
	/// - Parameters:
	///   - column: a single column
	///   - cells: the two-dimensional array we're reading from
	/// - Returns: an integer 
	func sum(forColumn column: Int, in cells: [[Int]]) -> Int {
		// We needs to read the nth item from each row that's in the column
		cells.reduce(0) { $0 + $1[column]}
	}
	
	/// A method that creates a new board
	/// - Parameter difficulty: the difficulty level the user has selected
	func startGame(_ difficulty: Difficulty) {
		isGameOver = false
		board.create(difficulty)
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
