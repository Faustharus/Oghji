//
//  ChartEventView.swift
//  Oghji
//
//  Created by Damien Chailloleau on 26/03/2023.
//

import SwiftUI

struct ChartEventView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Hello, Chart Pie !")
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

struct ChartEventView_Previews: PreviewProvider {
    static var previews: some View {
        ChartEventView()
    }
}
