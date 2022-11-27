//
//  ShareAddView.swift
//  TrackLink
//
//  Created by Can Yoldaş on 27.11.2022.
//

import SwiftUI

struct CategoryModel: PickerSelectable {
    var name: String
}

class ShareAddViewModel: ObservableObject {
    @Published var selectedCategory: CategoryModel?
    @Published var nameText: String = ""
}

struct ShareAddView: View {
    
    @ObservedObject private var viewModel = ShareAddViewModel()
    var urlString: String?
        
    var body: some View {
        LazyVStack(spacing: 20) {
            Text("Add New")
                .font(.mulish(.bold, 24))
                .padding(.bottom, 10)
            CustomTextPicker(title: "Category", items: [], selectedItem: $viewModel.selectedCategory)
            CustomTextField(text: $viewModel.nameText, placeholder: "Name")
            
            CustomTextField(text: .constant(urlString ?? ""), placeholder: "The URL")
            Button {
                // add item
            } label: {
                Text("Save link")
                    .foregroundColor(.white)
                    .font(.mulish(.bold, 16))
                    .padding(.vertical, 16)
                    .padding(.horizontal, 24)
                    .background(Color.jetGreen)
                    .cornerRadius(20)
            }
            .padding(.top, 20)
        }
        .padding(10)
    }
}

struct ShareAddView_Previews: PreviewProvider {
    static var previews: some View {
        ShareAddView(urlString: "http://google.com.tr/")
    }
}
