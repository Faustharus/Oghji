//
//  ContentView.swift
//  Oghji
//
//  Created by Damien Chailloleau on 25/03/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var emergencySwitch: Bool = false
    
    @State private var wattAmount = 0.0
    
    let icons = ["sofa", "microwave", "bathtub", "bed.double"]
    let iconsName = ["Salon", "Cuisine", "Salle de Bain", "Chambre"]
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                VStack {
//                    Image("oghji")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: geo.size.width * 0.2, height: geo.size.height * 0.2)
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(icons, id: \.self) { item in
                                Button {
                                    wattAmount += 10
                                } label: {
                                    VStack {
                                        ZStack {
                                            Circle()
                                                .stroke(.black, lineWidth: 2)
                                                .frame(width: geo.size.width * 0.1)
                                            VStack {
                                                Image(systemName: item)
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: geo.size.width * 0.07)
                                            }
                                        }
                                        Text(item)
                                    }
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 20)
                    
                    VStack {
                        HStack {
                            ButtonCategoryView(rectangleWidth: geo.size.width * 0.2, rectangleHeight: geo.size.height * 0.2, imageWidth: geo.size.width * 0.05, imageColor: .white, imageTextColor: .white, backgroundColor: .red, strokeColor: .red, imageName: "calendar", sectionName: "Calendrier") {
                                // TODO: More Code Later
                            }
                            
                            ButtonCategoryView(rectangleWidth: geo.size.width * 0.2, rectangleHeight: geo.size.height * 0.2, imageWidth: geo.size.width * 0.05, imageColor: .white, imageTextColor: .white, backgroundColor: .blue, strokeColor: .blue, imageName: "house", sectionName: "Domotique") {
                                // TODO: More Code Later
                            }
                        }
                        
                        HStack {
                            ButtonCategoryView(rectangleWidth: geo.size.width * 0.2, rectangleHeight: geo.size.height * 0.2, imageWidth: geo.size.width * 0.05, imageColor: .white, imageTextColor: .white, backgroundColor: .orange, strokeColor: .orange, imageName: "sun.max", sectionName: "Tarif HP/HC") {
                                // TODO: More Code Later
                            }
                            
                            ButtonCategoryView(rectangleWidth: geo.size.width * 0.2, rectangleHeight: geo.size.height * 0.2, imageWidth: geo.size.width * 0.05, imageColor: .white, imageTextColor: .white, backgroundColor: .green, strokeColor: .green, imageName: "chart.bar", sectionName: "Conso") {
                                // TODO: More Code Later
                            }
                        }
                    }
                    HStack {
                        VStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.3, height: geo.size.height * 0.1)
                                .symbolRenderingMode(.multicolor)
                        }
                        
                        
                        HStack {
                            // MARK: - LightBulb
                            /** Will allow an image to display the off-peak time */
                            
                            // MARK: - Progress View
                            /** Change the PV each time a new element is activated */
                            ProgressView("Conso Actuelle", value: wattAmount, total: 100)
                                .tint(wattAmount == 30 ? .orange : wattAmount == 40 ? .red : .green)
                            
                            Text("\(wattAmount, specifier: "%g") Watt")
                                .font(.headline)
                        }
                        
                        Button {
                            emergencySwitch = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                emergencySwitch = false
                                wattAmount = 0.0
                            }
                        } label: {
                            withAnimation(.easeOut(duration: 2)) {
                                Image(systemName: emergencySwitch ? "lightswitch.off" : "lightswitch.on")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.width * 0.15, height: geo.size.height * 0.15)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(emergencySwitch ? .red : .green, .blue)
                            }
                        }
                    }
                }
                .navigationTitle("Écran Principal")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink {
                            NewRoomView()
                        } label: {
                            Image(systemName: "plus")
                            Text("Ajouter")
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            // TODO: More Code Later
                        } label: {
                            Image(systemName: "gear")
                            Text("Paramètres")
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
