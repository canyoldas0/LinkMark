//
//  HomeViewModel.swift
//  TrackLink
//
//  Created by Can Yoldaş on 15.11.2022.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var groups: [GroupItem] = [
        .init(name: "Shoes", links: ["dsds"]),
        .init(name: "Furniture", links: ["dsds"]),
        .init(name: "Jeans", links: ["dsds"]),
        .init(name: "Trendyol", links: ["dsds"])
    ]
    
    @Published var list: [String] = [
        "https://www.google.com",
        "https://stackoverflow.com/questions/66427781/how-to-fetch-link-metadata-in-swiftui-using-linkpresentation",
        "https://www.pararius.com/apartment-for-rent/almere/983071a5/polenstraat"
    ]
}
