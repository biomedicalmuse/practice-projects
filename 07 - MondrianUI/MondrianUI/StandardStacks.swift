//
//  StandardStacks.swift
//  MondrianUI
//
//  Created by Natasha Godwin on 11/16/21.
//

import SwiftUI

struct StandardStack: View {
    var body: some View {
		 GeometryReader { geometry in
			 VStack(spacing: 10) {
				 ForEach(0..<3) { _ in
					 Rectangle()
						 .frame(width: geometry.size.width / 3)
				 }
			 }
			 .frame(width: geometry.size.width, height: geometry.size.height)
		 }
    }
}

struct StandardStacks_Previews: PreviewProvider {
    static var previews: some View {
        StandardStack()
    }
}
