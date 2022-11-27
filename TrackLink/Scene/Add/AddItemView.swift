//
//  AddItemView.swift
//  TrackLink
//
//  Created by Can Yoldaş on 13.11.2022.
//

import SwiftUI

enum ItemType: PickerSelectable, CaseIterable {    
    case category
    case item
    
    var name: String {
        switch self {
        case .category:
            return "Category"
        case .item:
            return "Link"
        }
    }
}

struct AddItemView: View {
    
    @State private var urlText: String = ""
    @State private var nameText: String = ""
    @State private var selectedItemType: ItemType?
    private var showingURL: Bool {
        selectedItemType == .item
    }
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Add New")
                .font(.mulish(.bold, 24))
                .padding(.bottom, 10)
            CustomTextPicker(title: "Type", items: ItemType.allCases, selectedItem: $selectedItemType)
            CustomTextField(text: $nameText, placeholder: "Name")
            
            
            if selectedItemType == .item {
                CustomTextField(text: $urlText, placeholder: "The URL")
            }
            Button {
                // add item
            } label: {
                Text("Add new item")
                    .foregroundColor(.white)
                    .font(.mulish(.bold, 16))
                    .padding(.vertical, 16)
                    .padding(.horizontal, 24)
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
