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

enum ListShownType: CaseIterable {
    case byGroup, byName
    
    func getTitle() -> String {
        switch self {
        case .byGroup:
            return "Categories"
        case .byName:
            return "Websites"
        }
    }
}

struct CarouselHeader: View {
    
    var buttonType: HeaderButtonType
    var headerTitle: String
    @Binding var menuType: ListShownType
    var viewAllAction: () -> Void
    
    var body: some View {
        // Carousel View - Populars
        HStack {
            Text(headerTitle)
                .foregroundColor(.primary)
                .font(.mulish(.bold, 20))
            Spacer()
            Menu {
                Picker(selection: $menuType, label: EmptyView()) {
                    ForEach(ListShownType.allCases, id: \.self) {
                        Text($0.getTitle())
                    }
                }
                .pickerStyle(.automatic)
                .padding(.vertical, 5)
            } label: {
                Text("List by")
                    .foregroundColor(.secondary)
                    .font(.mulish(.light, 14))
            }
            
        }
        .padding(.top, 12)
    }
}

struct CarouselHeader_Previews: PreviewProvider {
    static var previews: some View {
        CarouselHeader(buttonType: .image("filterIcon"), headerTitle: "Popular Now", menuType: .constant(.byGroup)) { }
    }
}
