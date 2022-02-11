//
//  LayoutIcon.swift
//  Grids
//
//  Created by Natasha Godwin on 2/3/22.
//

import SwiftUI

struct LayoutIcon: View {
	var name: String
	var body: some View {
		Image(systemName: name)
	}
}

struct LayoutIcon_Previews: PreviewProvider {
    static var previews: some View {
		 LayoutIcon(name: "rectangle.fill")
    }
}
