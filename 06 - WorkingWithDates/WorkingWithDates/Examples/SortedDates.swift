//
//  SortedDates.swift
//  WorkingWithDates
//
//  Created by Natasha Godwin on 8/5/21.
//

import SwiftUI

struct SortedDates: View {
	@StateObject private var events = EventList.generateDates(number: 1...20)
	@State private var sortAscending = false
	
	 var body: some View {
		NavigationView {
			List {
				ForEach(events.list) { event in
					Text(event.date.getString())
				}
			}
			.navigationTitle("Dates")
			.navigationBarItems(trailing: Button(action: {
				sortAscending.toggle()
				if sortAscending == true {
					events.ascendingSort()
				} else {
					events.descendingSort()
				}
			}) {
				VStack {
					Image(systemName: "arrow.up.arrow.down.square.fill")
						.font(.largeTitle)
					Text("Sort")
						.font(.caption)
				}
			})
		}
	 }
 }

struct SortedDates_Previews: PreviewProvider {
    static var previews: some View {
        SortedDates()
    }
}
