//
//  GridView.swift
//  Grids
//
//  Created by Natasha Godwin on 2/3/22.
//

import SwiftUI

struct FluidGrid: View {
	
	@State private var numberOfColumns: Int = 1
	@State private var height: CGFloat = 50
	
	let items = [Item](
		repeating: Item(
			text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac turpis egestas sed tempus urna et pharetra pharetra. Risus feugiat in ante metus. Tortor consequat id porta nibh venenatis cras. Rhoncus urna neque viverra justo nec ultrices dui sapien."),
		count: 50
	)
	
	var columns: [GridItem] {
		Array(
			repeating: GridItem(.flexible(minimum: 100, maximum: 200)),
			count: numberOfColumns
		)
	}
	
	
	var size: (width: CGFloat, height: CGFloat) {
		switch numberOfColumns {
		case 1:
			return (330.0, 200.0)
		case 2:
			return (150.0, 200.0)
		default:
			return (110.0, 110.0)
		}
	}
	
	 var body: some View {
		 ZStack {
			 Color(red: 211/255, green: 211/255, blue: 211/255, opacity: 0.8)
				 .edgesIgnoringSafeArea(.all)
			 VStack {
				 ScrollView(.vertical) {
					 LazyVGrid(columns: columns, spacing: 10) {
						 ForEach(0..<items.count) { item in
							 Text(items[item].text)
								 .frame(width: size.width, height: size.height)
								 .padding(5)
								 .background(Color.white)
								 .clipShape(RoundedRectangle(cornerRadius: 10.0))
						 }
					 }
				 }
				 Picker("Columns: \(numberOfColumns)", selection: $numberOfColumns.animation()) {
					 ForEach(1..<4, id: \.self) { number in
						 if number == 1 {
							 Text("\(number) column")
						 } else {
							 Text("\(number) columns")
						 }
							 
					 }
				 }
				 .pickerStyle(SegmentedPickerStyle())
			 }
		 }
	}
}

struct FluidGrid_Previews: PreviewProvider {
    static var previews: some View {
        FluidGrid()
    }
}
