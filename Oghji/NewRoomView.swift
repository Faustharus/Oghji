//
//  NewRoomView.swift
//  Oghji
//
//  Created by Damien Chailloleau on 25/03/2023.
//

import SwiftUI

struct NewRoomView: View {
    
    @State private var newRoom: Int = 0
    @State private var wattDetected = Int.random(in: 10...45)
    @State private var itemsDetected = Int.random(in: 1...5)
    
    let items = ["sofa", "microwave", "bathtub", "bed.double"]
    let iconsName = ["Salon", "Cuisine", "Salle de Bain", "Chambre"]
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                Form {
                    Section("Pièce à ajouter") {
                        Picker("Quelle Pièce ?", selection: $newRoom) {
                            ForEach(iconsName, id: \.self) { num in
                                Text(num)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    
                    Section("Équipements detecté") {
                        Text("Nombre d'équipements detecté: \(itemsDetected)")
                    }
                    
                    Section("Nombre de Watts") {
                        Text("Nombre de Watts detecté: \(wattDetected)")
                    }
                    
                    // MARK: - Simuler détection des équipements éléctriques et générer le nombre de watt en aléatoires
                    
                    Button {
                        // TODO: More Code Later
                    } label: {
                        Text("Confirmer")
                    }
                }
                .navigationTitle("Ajout Nouvelle Pièce")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct NewRoomView_Previews: PreviewProvider {
    static var previews: some View {
        NewRoomView()
    }
}
