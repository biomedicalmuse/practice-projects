//
//  LazyStacks.swift
//  MondrianUI
//
//  Created by Natasha Godwin on 11/16/21.
//

import SwiftUI

// This only works on iOS 14+

struct LazyStack: View {
	let columns = [
		GridItem(.fixed(130)),
		GridItem(.flexible()),
	]
	var body: some View {
		GeometryReader { geometry in
			LazyVGrid(columns: columns, spacing: 10) {
				ForEach(0..<2) { _ in
					Rectangle()
						.frame(height: geometry.size.height * 0.35)
				}
			}
		}
	 }
}

struct LazyStacks_Previews: PreviewProvider {
    static var previews: some View {
        LazyStack()
    }
}
