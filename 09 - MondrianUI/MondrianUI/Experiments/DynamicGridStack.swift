//
//  DynamicGridStack.swift
//  MondrianUI
//
//  Created by Natasha Godwin on 11/20/21.
//

import SwiftUI

struct DynamicGridStack: View {
	@State private var columns = 1
	@State private var height: CGFloat = 50
	
	var dynamicGrid: [GridItem] {
		Array(repeating: GridItem(.flexible(minimum: 100, maximum: 200)), count: Int(columns))
	}
	
	 var body: some View {
		 VStack {
			 Spacer()
			 LazyVGrid(columns: dynamicGrid, spacing: 2) {
				 ForEach(1..<8) { _ in
					 Rectangle()
						 .fill(Color.blue)
						 .frame(height: 50)
				 }
			 }
			 Spacer()
			 Picker("Columns: \(columns)", selection: $columns.animation()) {
				 ForEach(1..<4, id: \.self) { number in
					 Text("\(number) columns")
				 }
			 }
			 .pickerStyle(SegmentedPickerStyle())
		 }
	 }
}

struct DynamicGridStack_Previews: PreviewProvider {
    static var previews: some View {
        DynamicGridStack()
    }
}
