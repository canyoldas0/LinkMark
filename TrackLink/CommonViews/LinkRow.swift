//
//  ListView.swift
//  TrackLink
//
//  Created by Can Yoldaş on 12.11.2022.
//

import SwiftUI
import UIKit
import LinkPresentation

struct StringLink : Identifiable{
var id = UUID()
var string : String
}

struct LinkRow : UIViewRepresentable {
    
    var previewURL:URL
    
    @Binding var redraw: Bool
    
    func makeUIView(context: Context) -> LPLinkView {
        let view = LPLinkView(url: previewURL)
        view.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([
//            view.heightAnchor.constraint(equalToConstant: 30),
//            view.widthAnchor.constraint(equalToConstant: 400)
//        ])
        
        let provider = LPMetadataProvider()
        provider.startFetchingMetadata(for: previewURL) { (metadata, error) in
            if let md = metadata {
                DispatchQueue.main.async {
                    view.metadata = md
                    view.sizeToFit()
                    self.redraw.toggle()
                }
            }
            else if error != nil
            {
                let md = LPLinkMetadata()
                md.title = "Custom title"
                view.metadata = md
//                view.sizeToFit()
                self.redraw.toggle()
            }
        }
        
        return view
    }
    
    func updateUIView(_ view: LPLinkView, context: Context) {
        // New instance for each update
    }
}
