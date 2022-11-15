//
//  ListView.swift
//  TrackLink
//
//  Created by Can Yoldaş on 12.11.2022.
//

import SwiftUI
import LinkPresentation

struct ListView: View {
    
    @State var redrawPreview = false
    let links : [StringLink]  = [.init(string: "https://www.google.com/"),
                                 .init(string: "https://www.trendyol.com/riot-games/league-of-legends-200-rp-tr-p-40275358?boutiqueId=61&merchantId=170397&sav=true")]
    
    var body: some View {
        List(links){ l in
            LinkRow(previewURL: URL(string: l.string)!, redraw: self.$redrawPreview)
        }
        .environment(\.defaultMinListRowHeight, 100)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}

struct StringLink : Identifiable{
var id = UUID()
var string : String
}

class CustomLinkView: LPLinkView {
//    override var intrinsicContentSize: CGSize { CGSize(width: 0, height: super.intrinsicContentSize.height) }
}

struct LinkRow : UIViewRepresentable {
    
    var previewURL:URL
    
    @Binding var redraw: Bool
    
    func makeUIView(context: Context) -> CustomLinkView {
        let view = CustomLinkView(url: previewURL)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
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
                view.sizeToFit()
                self.redraw.toggle()
            }
        }
        
        return view
    }
    
    func updateUIView(_ view: CustomLinkView, context: Context) {
        // New instance for each update
    }
}


