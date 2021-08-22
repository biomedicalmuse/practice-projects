//
//  DateExtension.swift
//  WorkingWithDates
//
//  Created by Natasha Godwin on 8/5/21.
//

import SwiftUI

/*
Write an extension on Date that makes it easier to ...
	1. Create a Date from DateComponents
	2. Get DateComponents from a Date
	3. Turn a Date into a String, with different styling options
*/

extension Date {
	init(
		timeZone: TimeZone = TimeZone(abbreviation: "EST")!,
		year: Int,
		month: Int,
		day: Int,
		hour: Int = 0,
		minute: Int = 0,
		second: Int = 0) {
			var components = DateComponents()
			components.timeZone = timeZone
			components.year = year
			components.month = month
			components.day = day
			components.hour = hour
			components.minute = minute
			components.second = second
			self = Calendar.current.date(from: components)!
	}
	
	func getComponents() -> DateComponents {
		return Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
	}
	
	func getString(dateStyle: DateFormatter.Style = .long, timeStyle: DateFormatter.Style = .short) -> String {
		let formatter = DateFormatter()
		formatter.dateStyle = dateStyle
		formatter.timeStyle = timeStyle
		return formatter.string(from: self)
	}
}

