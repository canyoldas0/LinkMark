//
//  AddItemView.swift
//  TrackLink
//
//  Created by Can Yoldaş on 13.11.2022.
//

import SwiftUI

enum ItemType: String, CaseIterable {
    case category = "Category"
    case item = "Item"
}

struct AddItemView: View {
    
    @State private var urlText: String = ""
    @State private var nameText: String = ""
    @State private var selectedItemType: ItemType?
//    @State private var viewConfigured = false
    
    var body: some View {
        VStack(spacing: 4) {
            Picker(selection: $selectedItemType) {
                ForEach(ItemType.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            } label: {
                //
            }
            .pickerStyle(.wheel)

            
            Text("Add New Link")
                .font(.mulish(.bold, 24))
                .padding(.bottom, 10)
            CustomTextField(text: $urlText, placeholder: "Enter url")
            CustomTextField(text: $nameText, placeholder: "Enter name")
            Button {
                // add item
            } label: {
                Text("Add new item")
                    .foregroundColor(.white)
                    .font(.mulish(.bold, 16))
                    .padding(.vertical, 16)
                    .padding(.horizontal, 10)
                    .background(Color.jetGreen)
                    .cornerRadius(20)
            }
            .padding(.top, 20)
        }
        .padding(.horizontal, 16)
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
            .previewLayout(.sizeThatFits)
    }
}
