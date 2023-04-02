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
    @State private var roomName: String = ""
    
    let items = ["sofa", "microwave", "bathtub", "bed.double"]
    let iconsName = ["Salon", "Cuisine", "Salle de Bain", "Chambre"]
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                Form {
                    Section("Pièce à ajouter") {
                        Picker("Quelle Pièce ?", selection: $newRoom) {
                            ForEach(0 ..< iconsName.count, id: \.self) { num in
                                Text(iconsName[num])
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    
                    Section("Nom de la pièce") {
                        TextField("Nom", text: $roomName)
                            .keyboardType(.default)
                            .scrollDismissesKeyboard(.automatic)
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
                .background(Image("HouseBackground"))
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
