//
//  CarouselHeader.swift
//  JetQuiz
//
//  Created by Can Yoldaş on 29.10.2022.
//

import SwiftUI

enum HeaderButtonType {
    case text(String)
    case image(String)
}

struct CarouselHeader: View {
    
    var buttonType: HeaderButtonType
    var headerTitle: String
    var viewAllAction: () -> Void
    
    var body: some View {
        // Carousel View - Populars
        HStack {
            Text(headerTitle)
                .font(.mulish(.bold, 20))
            Spacer()
            Button {
                viewAllAction()
            } label: {

                switch buttonType {
                case .text(let string):
                    Text(string)
                        .foregroundColor(.textGray)
                        .font(.mulish(.semiBold))
                case .image(let string):
                    Image(string)
                        .resizable()
                        .frame(width: 32, height: 32)
                }
               
            }
        }
        .padding(.top, 12)
    }
}

struct CarouselHeader_Previews: PreviewProvider {
    static var previews: some View {
        CarouselHeader(buttonType: .image("filterIcon"), headerTitle: "Popular Now") { }
    }
}
