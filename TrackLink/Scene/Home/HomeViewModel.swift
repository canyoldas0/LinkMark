//
//  HomeViewModel.swift
//  TrackLink
//
//  Created by Can Yoldaş on 15.11.2022.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    @Published var groups: [GroupItem] = [
        .init(name: "Shoes", links: ["https://www.adidas.com.tr/tr/", "https://www.nike.com/tr/"]),
        .init(name: "Furniture", links: ["https://www.dogtas.com/tr", "https://www.ikea.com/nl/nl/"]),
        .init(name: "Jeans", links: ["Levi's", "Mavi", "Zara"]),
        .init(name: "Trendyol", links: ["Trendyoll"])
    ]
        
    @Published var list: [String] = [
        "https://www.google.com",
        "https://stackoverflow.com/questions/65673981/is-there-any-way-to-invoke-subviews-function-in-swiftui",
        "https://eksisozluk.com/katar-dunya-kupasi-sarkisi--7472382?day=2022-11-20",
        "https://stackoverflow.com/questions/56614080/how-to-remove-the-left-and-right-padding-of-a-list-in-swiftui"
    ]

    func filter() {
        let strArr = groups.filter{$0.isSelected}.map{$0.links}.flatMap{$0}
        list = strArr
    }
}
