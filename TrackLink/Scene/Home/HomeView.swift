//
//  HomeView.swift
//  TrackLink
//
//  Created by Can Yoldaş on 12.11.2022.
//

import SwiftUI

struct GroupItem: Identifiable {
    let id = UUID()
    var name: String
    var links: [String]
    var isSelected: Bool = false
}

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    @State private var redraw = false
    @State private var listShownType: ListShownType = .byGroup
    @State private var showingAddItem = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    // Carousel Group
                    CarouselHeader(buttonType: .image("filterIcon"), headerTitle: listShownType.getTitle(), menuType: $listShownType) {
                        
                    }
                    .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .center) {
                            ForEach($viewModel.groups) { item in
                                CategoryButton(item: item)
                            }
                        }
                    }
                    Spacer()
                    
                    List(viewModel.list, id: \.self) { string in
                        MetadataView(vm: LinkViewModel(link: string))
                    }
                }
                .padding(.top, 26)
            }
            // Navigation Bar
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("LinkMark")
                            .font(.mulish(.bold, 32))
                            .foregroundColor(.primary)
                        Spacer()
                        Button {
                            showingAddItem.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .foregroundColor(.primary)
                                .frame(width: 20, height: 20)
                        }
                    }
                    .padding(.vertical, 20)
                }
            }
            .background(Color(hex: "#EAEAEF"))
        }
        .sheet(isPresented: $showingAddItem) {
            AddItemView()
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
