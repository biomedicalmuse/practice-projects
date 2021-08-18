import SwiftUI

var years = [2015, 2016, 2017, 2018, 2019, 2020, 2021]

/*
 Exploring an array

 Before you sort, filter, or change an array, it's good to know what it contains.

 Here are several properties and methods for doing that:

 1. isEmpty - a property that that indicates whether an array is empty
 2. contains() - a method that checks whether a specific element exists
 3. allSatisfy() - a method that checks whether all elements satisfy a condition
 4. min() - a method that returns the lowest number
 5. max() a method that returns the highest number

*/

// isEmpty
print(years.isEmpty)

// .contains()
print(years.contains(2012))
print(years.contains(2021))
print(years.contains(2007))

// .allSatisfy()
print(years.allSatisfy({ $0 < 2015 }))

// min() and max()
let newestDate = years.max()!
let oldestDate = years.min()!
let numberOfYears = newestDate - oldestDate

print(newestDate)
print(oldestDate)
print("\(numberOfYears) years")

/*
  Getting a random element

  The randomElement() method gets a random element from an array
*/

let randomYear = years.randomElement()
print(randomYear!)

/*
 Sorting

 There are three methods are are useful for sorting:
   1. sort() - sorts an array based on a condition
   2. sorted() - sorts an array based on a condition and returns a new one
   3. reverse() - reverses the order of an array

*/

// .sort()
years.sort(by: { $0 > $1 }) // descending order (newest to oldest)
print(years)

// .sorted()
var sortedList = years.sorted() // ascending order by default
print(sortedList)

// reverse()
sortedList.reverse()
print(sortedList)

/*
 Shuffling

 You can shuffle an array with .shuffle(). If you want a new array, use .shuffled()
*/

years.shuffle()
print(years.shuffled())

/*
  Filtering

  The .filter() method removes elements based on a condition and returns a new array
*/

// .filter()
let before2018 = years.filter { $0 < 2018 }
let after2018 = years.filter { $0 > 2018 }

print(before2018.sorted())
print(after2018.sorted())


/*
 Finding firsts

 There are several properties and methods that are useful for getting specific items:
  1. first - a property that stores the first element of an array
  2. first() - a method that returns the first element that satisfies a condition
  3. firstIndexOf() - a method that returns the index of the first element that satisfies a condition
*/

// first
print(years.first!)

// first()
let firstYearBefore2018 = years.first(where: { $0 < 2018 })
print(firstYearBefore2018!)

// firstIndexOf()
let firstIndex = years.firstIndex(where: {$0 > 2018})
print(firstIndex!)


/*
 Changing an array
*/

// .map() - performs an action on each element, places it in a new array, and returns the result
let yearsAsStrings = years.map { String($0) }
print(yearsAsStrings)

// .reduce() - used to calculate the sum of an array


















