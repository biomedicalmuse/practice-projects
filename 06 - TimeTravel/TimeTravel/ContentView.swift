//
//  ContentView.swift
//  TimeTravel
//
//  Created by Natasha Godwin on 7/12/21.
//

import SwiftUI

struct ContentView: View {
	@State private var isActive = false
    var body: some View {
		if isActive == true {
			MainView()
		} else {
			WelcomeView()
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
