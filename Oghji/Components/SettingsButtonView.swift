//
//  SettingsButtonView.swift
//  Oghji
//
//  Created by Damien Chailloleau on 26/03/2023.
//

import SwiftUI

struct SettingsButtonView: View {
    
    let circleWidth: CGFloat
    let imageWidth: CGFloat
    
    let imageName: String
    let imageText: String
    
    let circleColor: Color?
    let textCircleColor: Color?
    
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
                        .foregroundColor(textCircleColor)
                }
            }
            .background(circleColor)
            .clipShape(Circle())
            .shadow(color: .black, radius: 5, x: -5, y: -5)
            
            Text(imageText)
                .font(.system(size: 20, weight: .medium, design: .serif))
                .foregroundColor(.black)
                .shadow(color: .gray, radius: 5, x: 10, y: 0)
        }
    }
}

struct SettingsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButtonView(circleWidth: 100, imageWidth: 50, imageName: "hand.raised", imageText: "Arrêt d'Urgence", circleColor: .gray, textCircleColor: .black)
    }
}
