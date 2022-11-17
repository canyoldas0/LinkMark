//
//  CustomTextField.swift
//  TrackLink
//
//  Created by Can Yoldaş on 18.11.2022.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        HStack {
            TextField(placeholder, text: $text)
                .font(.mulish(.regular, 16))
            Spacer()
            Button {
                resetText()
            } label: {
                Image(systemName: "xmark")
            }
            .opacity(text.isEmpty ? 0: 1)

        }
        .foregroundColor(Color(hex: "#BBBBBB"))
        .padding(12)
        .mask(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .overlay(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 1).fill(.black.opacity(0.3)))
        .padding(.top, 12)
    }
    
    private func resetText() {
        text = ""
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant("asdasd"), placeholder: "Enter")
    }
}
