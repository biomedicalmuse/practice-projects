//
//  ComposeButton.swift
//  Timeline
//
//  Created by Natasha Godwin on 7/27/21.
//

import SwiftUI

struct ComposeButton: View {
	@Binding var action: Bool
	var body: some View {
		Button(action: {
			action.toggle()
		}) {
			Image(systemName: "pencil.circle.fill")
				.font(Font.custom("", fixedSize: 40.0))
		}
	}
}

struct ComposeButton_Previews: PreviewProvider {
    static var previews: some View {
		ComposeButton(action: .constant(true))
    }
}
