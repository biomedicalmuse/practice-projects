//
//  LazyStacks.swift
//  MondrianUI
//
//  Created by Natasha Godwin on 11/16/21.
//

import SwiftUI

// This only works on iOS 14+

struct LazyStack: View {
	let squares = (1...100).map {"Item \($0)"}
	let columns = [
		//GridItem(.adaptive(minimum: 80))
		GridItem(.fixed(200)),
		GridItem(.flexible()),
		GridItem(.flexible())
	]
	var body: some View {
		ScrollView(.vertical) {
			LazyVGrid(columns: columns, spacing: 20) {
				ForEach(squares, id: \.self) { item in
					Text(item)
				}
			}
			.padding(.horizontal)
		}
		.frame(maxHeight: 500)
	 }
}

struct LazyStacks_Previews: PreviewProvider {
    static var previews: some View {
        LazyStack()
    }
}
