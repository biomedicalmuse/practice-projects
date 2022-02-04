//
//  HowGridsWork.swift
//  Grids
//
//  Created by Natasha Godwin on 2/4/22.
//

import SwiftUI

struct HowGridsWork: View {
	
	let content = [
		GridItem(.fixed(50)),
		GridItem(.fixed(50)),
		GridItem(.fixed(50))
	]
	
	 var body: some View {
		 ScrollView {
			 VStack(spacing: 20) {
				 Group {
					 Text("LazyVGrids arrange items in rows.")
					 LazyVGrid(columns: content, spacing: 10) {
						 ForEach(0..<11) { number in
							 Text("\(number)")
								 .frame(width: 50, height: 50)
								 .background(Color.blue)
								 .foregroundColor(.white)
								 .clipShape(RoundedRectangle(cornerRadius: 10.0))
						 }
					 }
				 }.frame(maxHeight: 300)
				 Group {
					 Text("LazyHGrids arrange items in columns.")
					 LazyHGrid(rows: content, spacing: 10) {
						 ForEach(0..<11) { number in
							 Text("\(number)")
								 .frame(width: 50, height: 50)
								 .background(Color.blue)
								 .foregroundColor(.white)
								 .clipShape(RoundedRectangle(cornerRadius: 10.0))
						 }
					 }
				 }.frame(maxHeight: 300)
			 }
		 }
	 }
}


struct HowGridsWork_Previews: PreviewProvider {
    static var previews: some View {
        HowGridsWork()
    }
}
