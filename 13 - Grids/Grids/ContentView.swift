//
//  ContentView.swift
//  Grids
//
//  Created by Natasha Godwin on 2/3/22.
//

import SwiftUI

/*
 .adaptive() - fits in as many items per row as possible
 .flexible() - allows you to control the number of columns
 .fixed() - limits each item to a specific size
 
 .fixed() and .flexible() - allows you to set the size of one column, while allowing the other to adapt
 
 */

struct ContentView: View {
    var body: some View {
		 FluidGrid()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
