//
//  SortedDates.swift
//  WorkingWithDates
//
//  Created by Natasha Godwin on 8/5/21.
//

import SwiftUI

struct SortedDates: View {
	@State private var dates = [Date]()
	 var body: some View {
		VStack {
			if !dates.isEmpty {
				HStack {
					Button("Newest") {
						dates.sort {
							$0 > $1
						}
					}
					Spacer()
					Button("Oldest") {
						dates.sort {
							$0 < $1
						}
					}
				}
				.padding()
			}
			Spacer()
			ScrollView(.vertical) {
				VStack(alignment: .leading) {
					ForEach(dates, id: \.self) {
						Text($0.formatted(as: "MMMM d, yyyy HH:mm"))
							.font(.body)
							.padding(5)
					}
				}
				.frame(maxWidth: .infinity)
			}
		}
		.navigationBarTitle("Timeline", displayMode: .inline)
		.navigationBarItems(trailing: Button("Add") {
			let year = Int.random(in: 2015...2021)
			let month = Int.random(in: 1...12)
			let day = Int.random(in: 1...30)
			let hour = Int.random(in: 1...24)
			let minute = Int.random(in: 1...59)
		
			let date = Date(dateString: "\(month)/\(day)/\(year) \(hour):\(minute)")
			
			dates.append(date)
		})
	 }
 }

struct SortedDates_Previews: PreviewProvider {
    static var previews: some View {
        SortedDates()
    }
}
