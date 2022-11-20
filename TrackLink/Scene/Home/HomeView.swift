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
    @State private var showingWebView = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    // Carousel Group
                    CarouselHeader(buttonType: .image("filterIcon"), headerTitle: listShownType.getTitle(), menuType: $listShownType) {
                    }
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(alignment: .center) {
                            ForEach($viewModel.groups) { item in
                                CategoryButton(item: item)
                            }
                        }
                    }
                    .padding(.all, 10)
                    .listRowInsets(EdgeInsets())
                }
                Section {
                    ForEach(viewModel.list, id: \.self) { item in
                        MetadataView(vm: LinkViewModel(link: item))
                            
                    }.onDelete(perform: delete)
                }
            }
            .frame(width: UIScreen.main.bounds.size.width,
                         alignment: .center)
                  .listRowInsets(.init())
                  .listStyle(.grouped)
            .background(Color(hex: "#EAEAEF"))
            .foregroundColor(.black)
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
        }
        .sheet(isPresented: $showingAddItem) {
            AddItemView()
        }
    }
    
    func delete(at offsets: IndexSet) {
        viewModel.list.remove(atOffsets: offsets)
       }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
