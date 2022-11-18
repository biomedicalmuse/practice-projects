//
//  GridStack.swift
//  MondrianUI
//
//  Created by Natasha Godwin on 11/20/21.
//

import SwiftUI

struct GridStack: View {
	var layout: [GridItem] {
		[
			.init(.fixed(120)),
			.init(.adaptive(minimum: 150)),
		]
	}
    var body: some View {
		 Group {
			 LazyVGrid(columns: layout) {
				 Rectangle()
					 .fill(Color.red)
					.frame(height: 200)
				 Rectangle()
					 .frame(height: 200)
				 Rectangle()
					.frame(height: 200)
				 HStack(alignment: .top) {
					 VStack {
						 Rectangle()
							.frame(height: 190)
						 HStack {
							 Rectangle()
								 .fill(Color.yellow)
								.frame(height: 10)
							 Rectangle()
								.frame(height: 10)
						 }
					 }
					 VStack {
							 Rectangle()
							 .fill(Color.blue)
							 .frame(width: 10, height: 90)
							 Rectangle()
							 .frame(width: 10, height: 110)

					 }
				 }
		    }
		 }.padding()
	}
}

struct GridStack_Previews: PreviewProvider {
    static var previews: some View {
        GridStack()
    }
}
