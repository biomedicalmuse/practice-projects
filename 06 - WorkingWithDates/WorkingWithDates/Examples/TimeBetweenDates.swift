//
//  TimeBetweenDates.swift
//  WorkingWithDates
//
//  Created by Natasha Godwin on 8/5/21.
//

import SwiftUI

struct TimeBetweenDates: View {
	@State private var event = ""
	@State private var date = Date()
	
	var timeSince: DateComponents {
		let calendar = Calendar.current
		let time = calendar.dateComponents([.year, .day, .hour], from: date, to: Date())
		return time
	}
	
	 var body: some View {
		VStack {
			Section {
				TextField("Event", text: $event)
					.textFieldStyle(RoundedBorderTextFieldStyle())
					.padding()
				DatePicker("Date", selection: $date, in: ...Date())
					.labelsHidden()
			}
			Section {
				Group {
					Text("\(timeSince.year!)")
						.font(.title)
						.fontWeight(.bold)
					Text("Years")
						.textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
						.padding(.bottom)
				}
				Group {
					Text("\(timeSince.day!)")
						.font(.title)
						.fontWeight(.bold)
					Text("Days")
						.textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
						.padding(.bottom)
				}
				Group {
					Text("\(timeSince.hour!)")
						.font(.title)
						.fontWeight(.bold)
					Text("Hours")
						.textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
						.padding(.bottom)
				}
			}
		}
		.navigationBarTitle(event.isEmpty ? "Major Life Event": event, displayMode: .inline)
	}
}

struct TimeBetweenDates_Previews: PreviewProvider {
    static var previews: some View {
        TimeBetweenDates()
    }
}
