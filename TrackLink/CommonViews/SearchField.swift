//
//  SearchField.swift
//  JetQuiz
//
//  Created by Can Yoldaş on 29.10.2022.
//

import SwiftUI

struct SearchField: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $text)
                .font(.mulish(.regular, 16))
            Spacer()
            Image(systemName: "slider.horizontal.3")
                .padding(.leading, 5)
        }
        .foregroundColor(Color(hex: "#BBBBBB"))
        .padding(12)
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 1).fill(.black.opacity(0.3)))
        .padding(.top, 12)
    }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchField(text: .constant("Search"))
    }
}
