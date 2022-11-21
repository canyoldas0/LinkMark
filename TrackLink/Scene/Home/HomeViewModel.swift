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
        "https://stackoverflow.com/questions/65673981/is-there-any-way-to-invoke-subviews-function-in-swiftui",
        "https://eksisozluk.com/katar-dunya-kupasi-sarkisi--7472382?day=2022-11-20",
        "https://stackoverflow.com/questions/56614080/how-to-remove-the-left-and-right-padding-of-a-list-in-swiftui"
    ]
}
