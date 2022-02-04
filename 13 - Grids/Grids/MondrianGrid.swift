//
//  GridAnatomy.swift
//  Grids
//
//  Created by Natasha Godwin on 2/4/22.
//

import SwiftUI

struct MondrianGrid: View {
	let columns = [
		GridItem(.fixed(70), spacing: 5, alignment: .top),
		GridItem(.fixed(200), spacing: 0, alignment: .top)
	]
	
	  var body: some View {
		  LazyVGrid(columns: columns, spacing: 0) {
			  ForEach(0..<6) { index in
				  VStack {
					  if index == 0 {
						  Rectangle()
							  .fill(Color.white)
							  .frame(height: 100)
					  } else if index == 1 {
						  Rectangle()
							  .fill(Color.red)
							  .frame(height: 100)
					  } else if index == 2 {
						  Rectangle()
							  .fill(Color.white)
							  .padding(.vertical, 5)
							  .frame(height: 100)
					  } else if index == 3 {
						  Rectangle()
							  .fill(Color.red)
							  .frame(height: 100)
					  } else if index == 4 {
						  Rectangle()
							  .fill(Color.blue)
							  .frame(height: 70)
					  } else if index == 5 {
						  Rectangle()
							  .fill(Color.white)
							  .padding(.vertical, 5)
							  .frame(height: 70)
					  }
										
				  }
			  }
		  }
		  .padding()
		  .background(Color.black)
		  .frame(maxWidth: 290)
	}
}

struct MondrianGrid_Previews: PreviewProvider {
    static var previews: some View {
        MondrianGrid()
    }
}
