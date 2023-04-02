//
//  RoomButtonView.swift
//  Oghji
//
//  Created by Damien Chailloleau on 25/03/2023.
//

import SwiftUI

struct RoomButtonView: View {
    
    @Binding var activated: Bool
    
    let circleWidth: CGFloat
    let imageWidth: CGFloat
    
    let imageName: String
    let imageText: String
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(.gray, lineWidth: 2)
                    .frame(width: circleWidth)
                VStack {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageWidth)
                        .foregroundColor(activated ? .white : .black)
                }
            }
            .background(activated ? .green : .gray)
            .shadow(color: activated ? .black : .clear, radius: activated ? 5 : 0, x: activated ? -10 : 0, y: activated ? -3 : 0)
            .clipShape(Circle())
            .shadow(color: activated ? .clear : .black, radius: activated ? 0 : 5, x: activated ? 0 : -5, y: activated ? 0 : -5)
            
            Text(imageText)
                .font(.system(size: 20, weight: .medium, design: .serif))
                .foregroundColor(activated ? .white : .black)
                .shadow(color: .gray, radius: 5, x: 10, y: 0)
        }
    }
}

struct RoomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RoomButtonView(activated: .constant(false), circleWidth: 100, imageWidth: 50, imageName: "bathtub", imageText: "Salle de Bain")
    }
}
