//
//  ButtonCategoryView.swift
//  Oghji
//
//  Created by Damien Chailloleau on 25/03/2023.
//

import SwiftUI

struct ButtonCategoryView: View {
    
    typealias ActionHandler = () -> Void
    
    let rectangleWidth: CGFloat
    let rectangleHeight: CGFloat
    let imageWidth: CGFloat
    
    let imageColor: Color
    let imageTextColor: Color
    let backgroundColor: Color
    let strokeColor: Color
    
    let imageName: String
    let sectionName: String
    
    let handler: ActionHandler
    
    init(rectangleWidth: CGFloat, rectangleHeight: CGFloat, imageWidth: CGFloat, imageColor: Color, imageTextColor: Color, backgroundColor: Color, strokeColor: Color, imageName: String, sectionName: String, handler: @escaping ButtonCategoryView.ActionHandler) {
        self.rectangleWidth = rectangleWidth
        self.rectangleHeight = rectangleHeight
        self.imageWidth = imageWidth
        self.imageColor = imageColor
        self.imageTextColor = imageTextColor
        self.backgroundColor = backgroundColor
        self.strokeColor = strokeColor
        self.imageName = imageName
        self.sectionName = sectionName
        self.handler = handler
    }
    
    var body: some View {
        Button(action: handler) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.blue, lineWidth: 2)
                    .frame(width: rectangleWidth, height: rectangleHeight)
                VStack {
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(imageColor)
                        .frame(width: imageWidth)
                    Text(sectionName)
                        .font(.headline)
                        .foregroundColor(imageTextColor)
                }
            }
            .background(backgroundColor)
        }
    }
}

struct ButtonCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCategoryView(rectangleWidth: 200, rectangleHeight: 200, imageWidth: 100, imageColor: .white, imageTextColor: .white, backgroundColor: .blue, strokeColor: .blue, imageName: "calendar", sectionName: "Calendrier") { }
            .previewLayout(.sizeThatFits)
    }
}
