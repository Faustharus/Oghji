//
//  MainView.swift
//  Oghji
//
//  Created by Damien Chailloleau on 26/03/2023.
//

import SwiftUI

enum DifferentPage: Identifiable {
    case calendar, domotic, price, chart
    
    var id: Int {
        hashValue
    }
}

struct MainView: View {
    
    @State private var emergencySwitch: Bool = false
    
    @State private var wattAmount = 0.0
    @State private var currentTemp = 19.0
    
    @State private var iconsPosition: Int = 0
    
    @State private var activated: Bool = false
    
    @State private var activeModal: DifferentPage?
    
    let icons = ["sofa", "microwave", "bathtub", "bed.double"]
    let iconsName = ["Salon", "Cuisine", "Salle de Bain", "Chambre"]
    
    let iconsOption = ["gear", "exclamationmark.triangle", "hand.raised"]
    let optionName = ["Paramètres", "Incidents", "Arrêt d'Urgence"]
    
    var body: some View {
        GeometryReader { geo in
            NavigationStack {
                ZStack {
                    Image("HouseBackground")
                        .resizable()
                        .frame(width: geo.size.width)
                        .blur(radius: 25, opaque: true)
                        .ignoresSafeArea()
                    VStack {
                        HStack {
                            // MARK: - Sidebar
                            ScrollView(.vertical) {
                                VStack {
                                    NavigationLink {
                                        Text("Vers page des paramètres")
                                    } label: {
                                        SettingsButtonView(circleWidth: geo.size.width * 0.08, imageWidth: geo.size.width * 0.05, imageName: "gear", imageText: "Paramètres", circleColor: Color(red: 0, green: 1, blue: 0.6, opacity: 0.5), textCircleColor: Color(red: 0, green: 1, blue: 0))
                                    }
                                    .padding(.vertical, 20)
                                    
                                    Button {
                                        // TODO: More Code Later
                                    } label: {
                                        SettingsButtonView(circleWidth: geo.size.width * 0.08, imageWidth: geo.size.width * 0.05, imageName: "exclamationmark.triangle", imageText: "Incidents", circleColor: Color(red: 0, green: 1, blue: 0.6, opacity: 0.5), textCircleColor: Color(red: 0, green: 1, blue: 0))
                                    }
                                    .padding(.vertical, 20)
                                    
                                    Button {
                                        wattAmount = 0
                                        activated = false
                                    } label: {
                                        SettingsButtonView(circleWidth: geo.size.width * 0.08, imageWidth: geo.size.width * 0.05, imageName: "hand.raised", imageText: "Arrêt d'Urgence", circleColor: wattAmount == 0 ? .gray : Color(red: 1, green: 0, blue: 0), textCircleColor: wattAmount == 0 ? Color(red: 0, green: 1, blue: 0.6, opacity: 0.5) : .white)
                                    }
                                    .padding(.vertical, 20)
                                    .disabled(wattAmount == 0 || !activated)
                                }
                                .frame(width: 200)
                            }
                            .background(Color.gray.opacity(0.2))
                            
                            // MARK: - Room Navbar
                            VStack {
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(0 ..< icons.count, id: \.self) { item in
                                            RoomButtonView(activated: $activated, circleWidth: geo.size.width * 0.08, imageWidth: geo.size.width * 0.05, imageName: "\(icons[item])", imageText: "\(iconsName[item])")
                                                .onTapGesture {
                                                    self.activated.toggle()
                                                    if activated {
                                                        wattAmount += 30
                                                    } else {
                                                        wattAmount -= 30
                                                    }
                                                }
                                        }
                                        .padding(.vertical, 20)
                                        .padding(.horizontal, 20)
                                    }
                                    .frame(height: 200)
                                }
                                
                                HStack {
                                    // MARK: - Current Power
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text("Conso Actuelle : ")
                                            
                                            Text("\(wattAmount, specifier: "%g") Watt")
                                        }
                                        .font(.system(size: 24, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                        
                                        ProgressView("", value: wattAmount, total: 100)
                                            .scaleEffect(x: 1, y: 4, anchor: .center)
                                            .tint(wattAmount == 30 ? .orange : wattAmount == 40 ? .red : .green)
                                            .animation(.linear(duration: 2), value: 2)
                                        
                                    }
                                }
                                .padding(.horizontal, 5)
                                
                                
                                Spacer().frame(height: geo.size.height * 0.1)
                                
                                // MARK: - Category Details Pages
                                VStack {
                                    HStack {
                                        NavButtonCategoryView(rectangleWidth: geo.size.width * 0.2, rectangleHeight: geo.size.height * 0.3, imageWidth: geo.size.width * 0.05, imageHeight: geo.size.height * 0.07, didTap: activeModal == .calendar, imageName: "calendar", categoryName: "Évenement prévue", nbOfEvents: "1") {
                                            activeModal = .calendar
                                        }
                                        
                                        NavButtonCategoryView(rectangleWidth: geo.size.width * 0.2, rectangleHeight: geo.size.height * 0.3, imageWidth: geo.size.width * 0.05, imageHeight: geo.size.height * 0.07, didTap: activeModal == .domotic, imageName: "house", categoryName: "Actions disponible", nbOfEvents: "1") {
                                            activeModal = .domotic
                                        }
                                        
                                        NavButtonCategoryView(rectangleWidth: geo.size.width * 0.2, rectangleHeight: geo.size.height * 0.3, imageWidth: geo.size.width * 0.05, imageHeight: geo.size.height * 0.07, didTap: activeModal == .price, imageName: "sun.max", categoryName: "Prix Actuel KWh", nbOfEvents: "0.20€") {
                                            activeModal = .price
                                        }
                                        
                                        NavButtonCategoryView(rectangleWidth: geo.size.width * 0.2, rectangleHeight: geo.size.height * 0.3, imageWidth: geo.size.width * 0.05, imageHeight: geo.size.height * 0.07, didTap: activeModal == .chart, imageName: "chart.bar", categoryName: "Historique Conso", nbOfEvents: "1") {
                                            activeModal = .chart
                                        }
                                    }
                                }
                                
                                Spacer().frame(height: geo.size.height * 0.1)
                                
                                // MARK: - Current Temp
                                VStack(alignment: .leading) {
                                    
                                    Stepper(value: $currentTemp, step: 0.5) {
                                        HStack {
                                            Text("Température actuelle : ")
                                            Text("\(currentTemp, specifier: "%.1f") °C")
                                        }
                                        .font(.system(size: 24, weight: .bold, design: .rounded))
                                        .foregroundColor(.white)
                                    }
                                    .padding(.horizontal, 20)
                                    
                                    ProgressView("", value: currentTemp, total: 30.0)
                                        .scaleEffect(x: 1, y: 4, anchor: .center)
                                        .tint(currentTemp >= 12 && currentTemp <= 15 ? .blue : currentTemp >= 15 && currentTemp <= 18 ? .yellow : currentTemp >= 18 && currentTemp <= 22 ? .orange : currentTemp >= 22 ? .red : .blue)
                                }
                                
                            }
                        }
                    }
                    .zIndex(999)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    // MARK: - Title Navbar
                }
                .navigationTitle("Écran Principale")
                .navigationBarTitleDisplayMode(.inline)
                .sheet(item: $activeModal) { item in
                    switch item {
                        case .calendar:
                            CalendarEventView()
                        case .domotic:
                            DomoticsEventView()
                        case .price:
                            PriceEventView()
                        case .chart:
                            ChartEventView()
                    }
                }
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
                        Image("Oghji")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width * 0.05)
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
