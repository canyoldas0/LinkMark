//
//  ContentView.swift
//  TrackLink
//
//  Created by Can Yoldaş on 6.11.2022.
//

import SwiftUI
import LinkPresentation

struct ContentView: View {
    
    @AppStorage("keyForMySharableData", store: UserDefaults(suiteName: "group.trackLink")) var username: String = "mySharableData"
    
    var body: some View {
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

