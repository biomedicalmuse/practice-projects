//: [Previous](@previous)

import Foundation

//: [Next](@next)

/*
Summary

Date, DateComponents, and Calendar handle the internal representation of date and time.
DateFormatter is used for external representation, i.e. handling how a date is presented to users on a screen. It converts Date into String and vice versa.

Note that Date's description and description(with:) methods are only meant for debugging, even though they technically do the same thing.

DateFormatter must have either a .dateStyle or .timeStyle property to display a date on the screen.

There are several options for values:
.none
.short
.medium
.long
.full

You can specify the language that should be used with each date, using the .locale property.



*/

// Swift was releated on June 2, 2014.

let swiftDebut = DateComponents(
	year: 2014,
	month: 6,
	day: 2
)
let swiftDebutDate = Calendar.current.date(from: swiftDebut)!
let formattedDate = DateFormatter().string(from: swiftDebutDate)

// This won't work because there's no dateStyle
print("Swift was released on \(formattedDate).")

let formatter = DateFormatter()
formatter.dateStyle = .none //
formatter.dateStyle = .short // 08/15/2021
formatter.dateStyle = .medium // Aug 15, 2021
formatter.dateStyle = .long // August 15, 2021
formatter.dateStyle = .full // Sunday, August 15, 2021

print("Swift was released on \(formatter.string(from: swiftDebutDate)).")

// SwiftUI was released on June 3, 2019 at 12:08 PM Pacific Daylight Time.

let swiftUIDebut = DateComponents(
	timeZone: TimeZone(abbreviation: "PDT"),
	year: 2019,
	month: 6,
	day: 3,
	hour: 12,
	minute: 8
)

formatter.timeStyle = .short // Add the time.

let swiftUIDebutDate = Calendar.current.date(from: swiftUIDebut)!
print("SwiftUI was released on \(formatter.string(from: swiftUIDebutDate)).")

formatter.dateStyle = .none // Hide the date.
formatter.timeStyle = .long // Show the time, with the time zone.
print("SwiftUI was released at \(formatter.string(from: swiftUIDebutDate)).")


// Displaying dates and times in other languages

formatter.dateStyle = .long
formatter.timeStyle = .long
formatter.locale = Locale(identifier: "ja")
print("Japanese: \(formatter.string(from: swiftUIDebutDate)).")



