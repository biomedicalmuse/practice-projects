//
//  TextExtension.swift
//  TimeTravel
//
//  Created by Natasha Godwin on 7/12/21.
//

import SwiftUI

extension Text {
	func numberStyle() -> some View {
		self
		 .font(.largeTitle)
		 .fontWeight(.bold)
	}
	
	func unitStyle() -> some View {
		self
		 .font(.headline)
		 .textCase(.uppercase)
	}
}
