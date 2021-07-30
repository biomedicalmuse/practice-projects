//
//  DateExtension.swift
//  Timeline
//
//  Created by Natasha Godwin on 7/23/21.
//

import Foundation

extension Date {
	var fullDate: String {
		let formatter = DateFormatter()
		formatter.dateStyle = .long
		return formatter.string(from: self)
	}
	
	var monthName: String {
		let formatter = DateFormatter()
		formatter.dateFormat = "MMM"
		return formatter.string(from: self)
	}
	
	var dayNumber: String {
		let formatter = DateFormatter()
		formatter.dateFormat = "d"
		return formatter.string(from: self)
	}
	
	var dayOfWeek: String {
	  let formatter = DateFormatter()
	  formatter.dateFormat = "EEE"
	  return formatter.string(from: self)
	}
	
	var time: String {
		let formatter = DateFormatter()
		formatter.timeStyle = .short
		return formatter.string(from: self)
	}
	
}
