//
//  NavButtonCategoryView.swift
//  Oghji
//
//  Created by Damien Chailloleau on 25/03/2023.
//

import SwiftUI

struct NavButtonCategoryView: View {
    
    typealias Actionhandler = () -> Void
    
    let rectangleWidth: CGFloat
    let rectangleHeight: CGFloat
    
    let imageWidth: CGFloat
    let imageHeight: CGFloat
    
    let didTap: Bool
    
    let imageName: String
    let categoryName: String
    let nbOfEvents: String
    let handler: Actionhandler
    
    init(rectangleWidth: CGFloat, rectangleHeight: CGFloat, imageWidth: CGFloat, imageHeight: CGFloat, didTap: Bool, imageName: String, categoryName: String, nbOfEvents: String, handler: @escaping NavButtonCategoryView.Actionhandler) {
        self.rectangleWidth = rectangleWidth
        self.rectangleHeight = rectangleHeight
        self.imageWidth = imageWidth
        self.imageHeight = imageHeight
        self.didTap = didTap
        self.imageName = imageName
        self.categoryName = categoryName
        self.nbOfEvents = nbOfEvents
        self.handler = handler
    }
    
    var body: some View {
        Button(action: handler) {
            ZStack(alignment: .bottomLeading) {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(.gray, lineWidth: 2)
                    .frame(width: rectangleWidth, height: rectangleHeight)
                VStack(alignment: .leading) {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageWidth, height: imageHeight)
                        .foregroundColor(didTap ? .white : .black)
                    Text(categoryName)
                        .foregroundColor(didTap ? .white : .black.opacity(0.6))
                        .font(.system(size: 24, weight: .medium, design: .serif))
                    Text(nbOfEvents)
                        .foregroundColor(didTap ? .white : .gray)
                        .font(.system(size: 30, weight: .bold, design: .serif))
                }
                .padding(.vertical, 25)
                .padding(.horizontal, 15)
            }
            .background(didTap ? Color.green : Color.white)
            .shadow(color: didTap ? .black : .clear, radius: didTap ? 3 : 0, x: didTap ? -10 : 0, y: didTap ? 5 : 0)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .shadow(color: didTap ? .clear : .black, radius: didTap ? 0 : 5, x: didTap ? 0 : -5, y: didTap ? 0 : -5)
        }
    }
}

struct NavButtonCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        NavButtonCategoryView(rectangleWidth: 250, rectangleHeight: 250, imageWidth: 50, imageHeight: 50, didTap: false, imageName: "calendar", categoryName: "Évenements prévue", nbOfEvents: "12") { }
    }
}
