//
//  ImpossibleGrid.swift
//  Grids
//
//  Created by Natasha Godwin on 2/4/22.
//

import SwiftUI

struct PolygonShape: Shape {
	var sides: Int
	
	func path(in rect: CGRect) -> Path {
		let height = Double(min(rect.size.width, rect.size.height)) / 2.0
		let center = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
		var path = Path()
		
		for i in 0..<sides {
			let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180
			let point = CGPoint(
				x: center.x + CGFloat(cos(angle) * height),
				y: center.y + CGFloat(sin(angle) * height))
			
			if i == 0 {
				path.move(to: point) // move to first vertex
			} else {
				path.addLine(to: point) // draw line to next vertex
			}
		}
		path.closeSubpath()
		return path
	}
}

struct HoneycombGrid: View {
	let columns: Int = 6
	let spacing: CGFloat = 10
	let size = CGSize(width: 100, height: 100)
	var hexagonWidth: CGFloat {
		(size.width / 2) * cos(.pi / 6) * 2
	}
    var body: some View {
		 let items = Array(
			repeating: GridItem(.fixed(hexagonWidth),
									  spacing: spacing),
			count: columns
		 )
		 
		 ScrollView(.horizontal) {
			 LazyVGrid(columns: items, spacing: spacing) {
				 ForEach(0..<100) { index in
					 VStack(spacing: 0) {
						 Rectangle()
							 .fill(Color.blue)
						    .frame(width: size.width, height: size.height)
							 .clipShape(PolygonShape(sides: 6).rotation(Angle.degrees(90)))
							 .offset(x: isEvenRow(index) ? 0 : hexagonWidth / 2 + (spacing / 2))
					 }
					 .frame(width: hexagonWidth, height: size.height)
				 }
			 }
			 .frame(width: (hexagonWidth + spacing) * CGFloat(columns - 1))
		 }
    }
	
	func isEvenRow(_ index: Int) -> Bool {
		(index / columns) % 2 == 0
	}
}

struct HoneycombGrid_Previews: PreviewProvider {
    static var previews: some View {
        HoneycombGrid()
    }
}
