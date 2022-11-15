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
                        LazyHStack(alignment: .center) {
                            ForEach($viewModel.groups) { item in
                                CategoryButton(item: item)
                            }
//                            .padding(.horizontal, 1)
                        }
                    }
                    Spacer()
                    ListView()
                    
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
                    .padding(.vertical, 20)
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
