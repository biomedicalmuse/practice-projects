//
//  GridAnatomy.swift
//  Grids
//
//  Created by Natasha Godwin on 2/4/22.
//

import SwiftUI

/*
 
 In SwiftUI, parent views can propose a size
 to child views, but those child views can ignore it.
  
 This is true with lazy grids, too.
 
 We can use this to create views that span multiple columns.
 
 */

struct MondrianGrid: View {
	let columns = [
		GridItem(.fixed(50), spacing: 5, alignment: .topLeading),
		GridItem(.fixed(50), spacing: 5, alignment: .leading),
		GridItem(.fixed(50), spacing: 5, alignment: .leading)
	]
	
	  var body: some View {
		  LazyVGrid(columns: columns, spacing: 10) {
			  ForEach(0..<7) { index in
				  Rectangle()
					  .fill(chooseColor(for: index))
					  .frame(
						width: chooseFrame(for: index).width,
						height: chooseFrame(for: index).height
					  )
					  .overlay(Text("\(index)"))
				  /*
					Although these items will grow to twice their size,
					the grid isn't aware of this and will place the next
					item accordingly.
					
					To avoid overlapping, this adds a transparent view in
					its place.
					*/
				  if index == 3 || index == 1  {
					  Color.clear
				  }
			  }
		}
		  .padding(5)
		  .background(Color.black)
		  .frame(maxWidth: 150)
		  
	}
	
	func chooseColor(for index: Int) -> Color {
		if index == 1 {
			return Color.red
		} else if index == 2 {
			return Color.blue
		} else if index == 6 {
			return Color.yellow
		}
		return Color.white
	}
	
	func chooseFrame(for index: Int) -> (width: CGFloat, height: CGFloat) {
		if index == 0 {
			return (width: 50, height: 100)
		} else if index == 1 {
			return (width: 105, height: 100)
		} else if index == 3 {
			return (width: 105, height: 50)
		} else if index == 4 || index == 5 || index == 6 {
			return (width: 50, height: 20)
		}
		return (width: 50, height: 50)
	}
	
}

struct MondrianGrid_Previews: PreviewProvider {
    static var previews: some View {
        MondrianGrid()
    }
}
