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
    
    @State private var width: CGFloat?
    @State private var groups: [GroupItem] = [
        .init(name: "Shoes", links: ["dsds"]),
        .init(name: "Furniture", links: ["dsds"]),
        .init(name: "Jeans", links: ["dsds"]),
        .init(name: "Trendyol", links: ["dsds"])
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // Carousel Group
                    CarouselHeader(buttonType: .image("filterIcon"), headerTitle: "Groups") {
                        print("hehe")
                    }
                    .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .center) {
                            ForEach($groups) { item in
                                CategoryButton(item: item)
                            }
                            .frame(minWidth: width)
//                            .padding(.horizontal, 1)
                        }
                    }
//                    ListView()
                    
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
                            // add
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .foregroundColor(.primary)
                                .frame(width: 20, height: 20)
                        }
                        
                    }
                    .padding(.top, 20)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
