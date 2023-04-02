//
//  CalendarEventView.swift
//  Oghji
//
//  Created by Damien Chailloleau on 25/03/2023.
//

import SwiftUI

struct CalendarEventView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var daySelected = Date()
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                VStack {
                    Text("Calendrier des Évenements")
                        .font(.title).bold()
                    
                    DatePicker("Évenements", selection: $daySelected, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.graphical)
                        .frame(width: geo.size.width, height: geo.size.height * 0.8)
                    
                    Button {
                        dismiss()
                    } label: {
                        Text("Fermer")
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
            }
        }
    }
}

struct CalendarEventView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarEventView()
    }
}
