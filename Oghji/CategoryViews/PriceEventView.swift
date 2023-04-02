//
//  PriceEventView.swift
//  Oghji
//
//  Created by Damien Chailloleau on 26/03/2023.
//

import SwiftUI

struct PriceEventView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Hello, Off-Peak Price !")
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

struct PriceEventView_Previews: PreviewProvider {
    static var previews: some View {
        PriceEventView()
    }
}
