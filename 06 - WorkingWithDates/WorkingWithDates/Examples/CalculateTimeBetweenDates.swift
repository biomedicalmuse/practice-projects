//
//  TimeBetweenDates.swift
//  WorkingWithDates
//
//  Created by Natasha Godwin on 8/5/21.
//

import SwiftUI


struct CalculateTimeBetweenDates: View {
	@State private var firstDate = Date()
	@State private var secondDate = Date()
	@State private var units = DatePickerComponents.date
	
	let date = DatePickerComponents.date
	let time = DatePickerComponents.hourAndMinute
	let all = [DatePickerComponents.date, DatePickerComponents.hourAndMinute]
	
	var calculateTime: DateComponents {
		switch units {
		  case date:
			return Calendar.current.dateComponents([.year, .month, .day], from: firstDate, to: secondDate)
		  case time:
			return Calendar.current.dateComponents([.hour, .minute, .second], from: firstDate, to: secondDate)
		  default:
			return Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: firstDate, to: secondDate)
			
		}
	}

	
	var body: some View {
		VStack {
			if units == date {
				Text("\(calculateTime.day!) Days")
			} else if units == time {
				Text("\(calculateTime.hour!) Hours")
			} else {
				Text("\(calculateTime.day!) Days and \(calculateTime.hour!) Hours")
			}
		
			Group {
				DatePicker("", selection: $firstDate, displayedComponents: units)
				DatePicker("", selection: $secondDate, displayedComponents: units)
			}.labelsHidden()
			
			HStack {
				Button("Date") {
					units = DatePickerComponents.date
				}.padding()
				Button("Time") {
					units = DatePickerComponents.hourAndMinute
				}.padding()
				Button("Default") {
					units = [DatePickerComponents.date, DatePickerComponents.hourAndMinute]
				}.padding()
			}
		}
		.labelsHidden()
	}

}


struct TimeBetweenDates_Previews: PreviewProvider {
    static var previews: some View {
		CalculateTimeBetweenDates()
    }
}
