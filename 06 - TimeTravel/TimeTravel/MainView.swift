//
//  MainView.swift
//  TimeTravel
//
//  Created by Natasha Godwin on 7/12/21.
//

import SwiftUI

struct MainView: View {
	let fakeData = [
		(number: "2", unit: "years"),
		(number: "31", unit: "days"),
		(number: "15:11:18", unit: "hours:minutes:seconds")
	]
	@State private var addingNewEvent = false
	
	var body: some View {
		ZStack {
			LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
				.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
			VStack {
				HStack {
					VStack(alignment: .leading) {
						Text("Time Since")
							.font(.headline)
						Text("Cancer Surgery")
							.font(.largeTitle)
							.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
					}
					Spacer()
					Button(action:  {
						addingNewEvent.toggle()
					}) {
						Image(systemName: "plus.circle")
							.font(.title)
					}
				}.padding(20)
				Spacer()
				VStack(spacing: 5) {
					ForEach(fakeData, id: \.number) { day in
						VStack {
							Text(day.number)
								.numberStyle()
							Text(day.unit)
								.unitStyle()
						}
					}
				}
				Spacer()
			}
			.foregroundColor(.white)
		}
		.sheet(isPresented: $addingNewEvent) {
			Text("Add")
		}
	}
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
