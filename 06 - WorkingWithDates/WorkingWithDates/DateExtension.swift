//
//  DateExtension.swift
//  WorkingWithDates
//
//  Created by Natasha Godwin on 8/5/21.
//

import SwiftUI

extension Date {
	
	func formatted(as format: String) -> String {
	  let dateFormatter = DateFormatter()
	  dateFormatter.dateFormat = format
	  return dateFormatter.string(from: self)
	}
	
	func standardFormat() -> String {
	  let dateFormatter = DateFormatter()
	  dateFormatter.calendar = Calendar.current
	  dateFormatter.dateStyle = .medium
	  dateFormatter.timeStyle = .short
	  return dateFormatter.string(from: self)
	}
	
	// Generate dates from strings. Used to create sample data.
	init(dateString: String) {
		let formatter = DateFormatter()
		formatter.dateFormat = "MM/dd/yyyy HH:mm"
		formatter.calendar = Calendar.current
		let date = formatter.date(from: dateString) ?? Date()
		self.init(timeInterval:0, since: date)
	}
}
