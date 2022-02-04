//
//  GridView.swift
//  Grids
//
//  Created by Natasha Godwin on 2/3/22.
//

import SwiftUI

struct FluidGrid: View {
	let items = [Item](
		repeating: Item(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac turpis egestas sed tempus urna et pharetra pharetra. Risus feugiat in ante metus. Tortor consequat id porta nibh venenatis cras. Rhoncus urna neque viverra justo nec ultrices dui sapien."),
		count: 50)
	
	@State private var layout = Columns.one
	
	enum Columns {
		case one
		case two
		case three
	}
	
	var columns: [GridItem] {
		switch layout {
		  case Columns.one:
			return [
				GridItem(.flexible())
			 ]
		  case Columns.two:
			return [
				GridItem(.flexible()),
				GridItem(.flexible()),
			]
		  case Columns.three:
			return [
				GridItem(.flexible()),
				GridItem(.flexible()),
				GridItem(.flexible())
			]
								  
		}
	}
	
	var height: CGFloat? {
		switch layout {
		case Columns.one:
			return nil
		case Columns.two:
			return 150
		case Columns.three:
			return 50
		}
	}
	
	var fontSize: CGFloat {
		switch layout {
		case Columns.one:
			return 15
		case Columns.two:
			return 10
		case Columns.three:
			return 16
		}
	}
	
	var body: some View {
		ZStack {
			Color(red: 225 / 255, green: 227 / 255, blue: 230 / 255, opacity: 1.0)
				.edgesIgnoringSafeArea(.all)
			VStack {
				HStack(spacing: 50) {
					Button(action: {
						layout = .one
					}) {
						LayoutIcon(name: "rectangle.fill")
					}
					Button(action: {
						layout = .two
					}) {
						LayoutIcon(name: "rectangle.grid.2x2.fill")
					}
					Button(action: {
						layout = .three
					}) {
						LayoutIcon(name: "rectangle.grid.3x2.fill")
					}
				}
				.padding(.vertical)
				ScrollView(.vertical) {
					LazyVGrid(columns: columns, spacing: 10) {
						ForEach(0..<items.count) { index in
							Text(items[index].text)
								.frame(height: height)
								.font(.system(size: fontSize))
								.padding()
								.background(Color.white)
								.clipShape(RoundedRectangle(cornerRadius: 5.0))
						}
					}.padding(.horizontal)
				}
			}
		}
	}
}

struct FluidGrid_Previews: PreviewProvider {
    static var previews: some View {
        FluidGrid()
    }
}
