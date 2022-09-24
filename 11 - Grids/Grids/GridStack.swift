//
//  GridStack.swift
//  Grids
//
//  Created by Natasha Godwin on 2/3/22.
//

import SwiftUI

/*
 Lazy grids don't work on iOS 13, so to support those users,
 we'll have to construct a grid using VStack and HStack.
 
 To do that, we'll leverage SwiftUI's view builder system, which
 wraps multiple views in a TupleView and sends it back as one view.

 */

struct GridStack<Content: View>: View {
	let rows: Int
	let columns: Int
	let content: (Int, Int) -> Content
	
	var body: some View {
		HStack {
			ForEach(0..<columns, id: \.self) { column in
				VStack {
					ForEach(0..<rows, id: \.self) { row in
						content(row, column )
					}
				}
			}
		}
    }
	init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
		self.rows = rows
		self.columns = columns
		self.content = content
	}
}


