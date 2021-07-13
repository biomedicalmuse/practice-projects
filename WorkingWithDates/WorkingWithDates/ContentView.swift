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
	
	var timeBetweenDates: DateComponents {
		let calendar = Calendar.current
		let amount = calendar.dateComponents([.day], from: self, to: Date())
		return amount
	}
}


struct ContentView: View {
	@State private var date = Date()
	
	var timeBetweenDates: DateComponents {
		let calendar = Calendar.current
		let time = calendar.dateComponents([.year, .day, .hour], from: date, to: Date())
		return time
	}
	
    var body: some View {
		VStack(alignment: .leading, spacing: 5) {
			Text("Selection:")
				.font(.headline)
			Text("\(date.standardFormat())")
			Text("Years")
			Text("\(timeBetweenDates.year!)")
			Text("Days")
			Text("\(timeBetweenDates.day!)")
			Text("Hours")
			Text("\(timeBetweenDates.hour!)")
			DatePicker("Date", selection: $date)
				.labelsHidden()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
