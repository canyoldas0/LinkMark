//
//  CategoryButton.swift
//  TrackLink
//
//  Created by Can Yoldaş on 13.11.2022.
//

import SwiftUI

struct CategoryButton: View {
    
    @Binding var item: GroupItem
    
    var body: some View {
        Button {
            item.isSelected.toggle()
        } label: {
            HStack {
                Text("\(item.name)")
                Text("\(item.links.count)")
            }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .font(.mulish(.semiBold, 16))
                .background(item.isSelected ? Color.jetGreen: Color(hex: "#EEEEEE"))
                .cornerRadius(30)
                .padding(.horizontal, 3)
        }
        .foregroundColor(item.isSelected ? .white: .black)
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButton(item: .constant(.init(name: "Trendyol", links: ["sdsda", "asdads"])))
            .previewLayout(.sizeThatFits)
    }
}
