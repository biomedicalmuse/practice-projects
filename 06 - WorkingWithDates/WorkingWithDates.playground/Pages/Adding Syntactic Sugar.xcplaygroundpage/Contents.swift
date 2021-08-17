//: [Previous](@previous)

import Foundation

//: [Next](@next)

/*

Summary

  
*/


// The long way to figure out a date

var timeInterval = DateComponents(
	month: 4,
	day: 15,
	hour: 12,
	minute: 30,
	second: 35
)
let futureDate = Calendar.current.date(byAdding: timeInterval, to: Date())!
let formatter = DateFormatter()
formatter.dateStyle = .long
formatter.timeStyle = .medium
print("It will be \(formatter.string(from: futureDate)) in 4 months, 15 days, 12 hours, 30 minutes, and 35 seconds.")


// There's a better way

// Write a function that makes it possible to add and subtract DateComponents
func combineComponents(_ lhs: DateComponents, _ rhs: DateComponents, multiplier: Int = 1) -> DateComponents {
	 var result = DateComponents()
	 // Changing the multiplier to a negative value turns each of these into subtraction
	 result.nanosecond = (lhs.nanosecond ?? 0) + (rhs.nanosecond ?? 0) * multiplier
	 result.second     = (lhs.second ?? 0) + (rhs.second ?? 0) * multiplier
	 result.minute     = (lhs.minute ?? 0) + (rhs.minute ?? 0) * multiplier
	 result.hour       = (lhs.hour ?? 0) + (rhs.hour ?? 0) * multiplier
	 result.day        = (lhs.day ?? 0) + (rhs.day ?? 0) * multiplier
	 result.weekOfYear = (lhs.weekOfYear ?? 0) + (rhs.weekOfYear ?? 0) * multiplier
	 result.month      = (lhs.month ?? 0) + (rhs.month ?? 0) * multiplier
	 result.year       = (lhs.year ?? 0) + (rhs.year ?? 0) * multiplier
	 return result
}

func +(_ lhs: DateComponents, _ rhs: DateComponents) -> DateComponents {
	return combineComponents(lhs, rhs)
}

func -(_ lhs: DateComponents, _ rhs: DateComponents) -> DateComponents {
	return combineComponents(lhs, rhs, multiplier: -1)
}

// Examples
var oneDay = DateComponents(day: 1)
var threeDays = DateComponents(day: 3)


let additionExample = oneDay + threeDays
print("Result: \(additionExample.day!) days")

let subtractionResult = threeDays - oneDay
print("Result: \(subtractionResult.day!) days")


// Write a function that makes it possible to negate DateComponents

prefix func -(components: DateComponents) -> DateComponents {
  var result = DateComponents()
  if components.nanosecond != nil { result.nanosecond = -components.nanosecond! }
  if components.second     != nil { result.second     = -components.second! }
  if components.minute     != nil { result.minute     = -components.minute! }
  if components.hour       != nil { result.hour       = -components.hour! }
  if components.day        != nil { result.day        = -components.day! }
  if components.weekOfYear != nil { result.weekOfYear = -components.weekOfYear! }
  if components.month      != nil { result.month      = -components.month! }
  if components.year       != nil { result.year       = -components.year! }
  return result
}

// Examples
let negativeTime = -oneDay
print("Result: \(negativeTime.day!)")

// Date + DateComponents
func +(_ lhs: Date, _ rhs: DateComponents) -> Date {
  return Calendar.current.date(byAdding: rhs, to: lhs)!
}

// DateComponents + Date
func +(_ lhs: DateComponents, _ rhs: Date) -> Date {
  return rhs + lhs
}


// Date - DateComponents
func -(_ lhs: Date, _ rhs: DateComponents) -> Date {
  return lhs + (-rhs)
}


// Examples of all of the above

let tomorrow = Date() + oneDay
formatter.timeStyle = .none
print("Tomorrow is \(formatter.string(from: tomorrow)).")

let yesterday = Date() - oneDay
print("Yesterday was \(formatter.string(from: yesterday)).")


// Date Extension

extension Date {
	// DateComponents -> Date
	init(year: Int,month: Int,day: Int,hour: Int = 0, minute: Int = 0, second: Int = 0, timeZone: TimeZone = TimeZone(abbreviation: "UTC")!) {
		var components = DateComponents()
		components.year = year
		components.month = month
		components.day = day
		components.hour = hour
		components.minute = minute
		components.second = second
		components.timeZone = timeZone
		self = Calendar.current.date(from: components)!
	 }
	
	// String -> Date
	init(dateString: String) {
	   let formatter = DateFormatter()
		formatter.dateFormat = "yyyy-MM-dd HH:mm:ss zz"
		self = formatter.date(from: dateString)!
	 }
	
	// Description
	var desc: String {
		 get {
			let PREFERRED_LOCALE = "en_US" // Use whatever locale you prefer!
			return self.description(with: Locale(identifier: PREFERRED_LOCALE))
		 }
	  }
}

let diagnosis = Date(year: 2019, month: 03, day: 21)
print("\(diagnosis)")
print("\(diagnosis.desc)")

// Write a function that finds the difference between two dates

func -(_ lhs: Date, _ rhs: Date) -> DateComponents {
  return Calendar.current.dateComponents(
	 [.year, .month, .weekOfYear, .day, .hour, .minute, .second, .nanosecond],
	 from: rhs,
	 to: lhs)
}

let lengthOfTime = Date() - Date(dateString: "1969-07-20 20:18:00 UTC")
print("It's been \(lengthOfTime.year!) years since the moon landing.")


// Write an extension on Int that converts integers to DateComponents

extension Int {

  var second: DateComponents {
	 var components = DateComponents()
	 components.second = self;
	 return components
  }
  
  var seconds: DateComponents {
	 return self.second
  }
  
  var minute: DateComponents {
	 var components = DateComponents()
	 components.minute = self;
	 return components
  }
  
  var minutes: DateComponents {
	 return self.minute
  }
  
  var hour: DateComponents {
	 var components = DateComponents()
	 components.hour = self;
	 return components
  }
  
  var hours: DateComponents {
	 return self.hour
  }
  
  var day: DateComponents {
	 var components = DateComponents()
	 components.day = self;
	 return components
  }
  
  var days: DateComponents {
	 return self.day
  }
  
  var week: DateComponents {
	 var components = DateComponents()
	 components.weekOfYear = self;
	 return components
  }
  
  var weeks: DateComponents {
	 return self.week
  }
  
  var month: DateComponents {
	 var components = DateComponents()
	 components.month = self;
	 return components
  }
  
  var months: DateComponents {
	 return self.month
  }
  
  var year: DateComponents {
	 var components = DateComponents()
	 components.year = self;
	 return components
  }
  
  var years: DateComponents {
	 return self.year
  }
  
}

let hourFromNow = (Date() + 1.hour).desc
print("It will be \(hourFromNow) in an hour.")

let tenYearsFromNow = (Date() + 10.year).desc
print("In 10 years, it will be \(tenYearsFromNow)")

// Making it even easier

extension DateComponents {
  
  var fromNow: Date {
	 return Calendar.current.date(byAdding: self,
											to: Date())!
  }
  
  var ago: Date {
	 return Calendar.current.date(byAdding: -self,
											to: Date())!
  }
  
}

print("It will be \(2.weeks.fromNow.desc) in two weeks.")
print("It was \(5.years.ago.desc) five years ago.")
