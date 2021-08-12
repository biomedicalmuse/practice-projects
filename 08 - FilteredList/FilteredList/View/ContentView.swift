//
//  ContentView.swift
//  FilteredList
//
//  Created by Natasha Godwin on 8/12/21.
//

import SwiftUI
import CoreData


struct ContentView: View {
    var body: some View {
		Notes(dateFilter: Date())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
