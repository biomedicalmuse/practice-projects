//
//  ImpossibleGrid.swift
//  Grids
//
//  Created by Natasha Godwin on 2/4/22.
//

import SwiftUI

struct ImpossibleGrid: View {
	
	let content = [
		GridItem(.fixed(50)),
		GridItem(.adaptive(minimum: 100, maximum: 200)),
		GridItem(.fixed(50))
	]
	
    var body: some View {
		 LazyVGrid(columns: content, spacing: 10) {
			 ForEach(0..<11) { number in
				 Text("\(number)")
					 .frame(width: 50, height: 50)
					 .background(Color.blue)
					 .foregroundColor(.white)
					 .clipShape(RoundedRectangle(cornerRadius: 10.0))
			 }
		 }
    }
}

struct ImpossibleGrid_Previews: PreviewProvider {
    static var previews: some View {
        ImpossibleGrid()
    }
}
