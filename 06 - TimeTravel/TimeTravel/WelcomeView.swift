//
//  EmptyView.swift
//  TimeTravel
//
//  Created by Natasha Godwin on 7/12/21.
//

import SwiftUI

struct WelcomeView: View {
	@State private var addingNewEvent = false
	 var body: some View {
		NavigationView {
			Text("Add an event to start tracking")
				.foregroundColor(.gray)
				.navigationBarItems(trailing: Button(action: {
					addingNewEvent.toggle()
				}) {
					Image(systemName: "plus.circle")
						.font(.title)
				})
				.sheet(isPresented: $addingNewEvent) {
					AddEventView()
				}
		  }
	 }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
