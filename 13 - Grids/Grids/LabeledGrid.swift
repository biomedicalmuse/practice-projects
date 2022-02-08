//
//  LabeledGrid.swift
//  Grids
//
//  Created by Natasha Godwin on 2/8/22.
//

import SwiftUI

struct HeaderView: View {
	var title: String
	var body: some View {
		Text(title)
	}
}

struct LabeledGrid: View {
	let columns = 3
    var body: some View {
		 let items = Array(repeating: GridItem(.fixed(100)), count: columns)
		 ScrollView(.vertical) {
			 LazyVGrid(columns: items, spacing: 10, pinnedViews: .sectionHeaders) {
				 Section(header: HeaderView(title: "Numbers")) {
					 ForEach(0..<100, id: \.self) { index in
						 Text("\(index)")
							 .frame(width: 100, height: 100)
							 .background(Color.blue)
					 }
				 }
			 }
		 }.padding(.horizontal)
    }
}

struct LabeledGrid_Previews: PreviewProvider {
    static var previews: some View {
        LabeledGrid()
    }
}
