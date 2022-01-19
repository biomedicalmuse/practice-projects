//
//  Card.swift
//  Cards
//
//  Created by Natasha Godwin on 1/19/22.
//

import SwiftUI

struct Card: Identifiable, Equatable {
	let id = UUID()
	let content: String
	let color: Color
	
	static let example = Card(
		content: "An app for tracking your ideas over time.",
		color: .blue
	)
}
