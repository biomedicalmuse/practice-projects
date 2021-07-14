//
//  ContentView.swift
//  WorkingWithDates
//
//  Created by Natasha Godwin on 7/13/21.
//

import SwiftUI

extension Date {
	func standardFormat() -> String {
	  let dateFormatter = DateFormatter()
	  dateFormatter.calendar = Calendar.current
	  dateFormatter.dateStyle = .medium
	  dateFormatter.timeStyle = .short
	  return dateFormatter.string(from: self)
	}
}


struct ContentView: View {
	@State private var event = ""
	@State private var date = Date()
	
	var timeBetweenDates: DateComponents {
		let calendar = Calendar.current
		let time = calendar.dateComponents([.year, .day, .hour], from: date, to: Date())
		return time
	}
	
    var body: some View {
		NavigationView {
			VStack {
				Section {
					TextField("Event", text: $event)
						.textFieldStyle(RoundedBorderTextFieldStyle())
						.padding()
					DatePicker("Date", selection: $date)
						.labelsHidden()
				}
				Section {
					Group {
						Text("\(timeBetweenDates.year!)")
							.font(.title)
							.fontWeight(.bold)
						Text("Years")
							.textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
							.padding(.bottom)
					}
					Group {
						Text("\(timeBetweenDates.day!)")
							.font(.title)
							.fontWeight(.bold)
						Text("Days")
							.textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
							.padding(.bottom)
					}
					Group {
						Text("\(timeBetweenDates.hour!)")
							.font(.title)
							.fontWeight(.bold)
						Text("Hours")
							.textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
							.padding(.bottom)
					}
				}
			}
			.navigationTitle(event.isEmpty ? "Major Life Event": event)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
