//
//  DomoticsEventView.swift
//  Oghji
//
//  Created by Damien Chailloleau on 26/03/2023.
//

import SwiftUI

struct DomoticsEventView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Hello, Domotics !")
                .font(.headline)
            
            Button {
                dismiss()
            } label: {
                Text("Fermer")
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

struct DomoticsEventView_Previews: PreviewProvider {
    static var previews: some View {
        DomoticsEventView()
    }
}
