//
//  ContentView.swift
//  DynamicList
//
//  Created by Natasha Godwin on 8/19/21.
//

import SwiftUI

/*
 
A basic to-do list application

Each task has ...
- a name
- a deadline
- a category
- a priority

Users can ...
- Add
- Edit
- Delete
- Move
- Sort (by date, category, priority)
- Filter (by date, category, priority)
- Select
- Group (by category)

And view the list as ...
- a plain list
- a grouped list


*/


struct ContentView: View {
    var body: some View {
		Text("Hello, List!")
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
