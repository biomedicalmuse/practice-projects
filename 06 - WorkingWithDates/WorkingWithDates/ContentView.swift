//
//  ContentView.swift
//  WorkingWithDates
//
//  Created by Natasha Godwin on 7/13/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
		NavigationView {
			List {
				NavigationLink(destination: SortedDates()) {
					Text("Sort by date")
				}
				NavigationLink(destination: TimeBetweenDates()) {
					Text("Calculate time between dates")
				}
			}
			.navigationBarTitle("Date")
			.listStyle(InsetGroupedListStyle())
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
