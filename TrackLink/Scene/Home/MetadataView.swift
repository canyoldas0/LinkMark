//
//  MetadataView.swift
//  TrackLink
//
//  Created by Can Yoldaş on 15.11.2022.
//

import SwiftUI
import LinkPresentation

final class LinkViewModel : ObservableObject {
    let metadataProvider = LPMetadataProvider()
    
    @Published var metadata: LPLinkMetadata?
    @Published var image: UIImage?
    var urlString: String?
    
    init(link: String) {
        guard let url = URL(string: link) else {
            return
        }
        self.urlString = link
        metadataProvider.startFetchingMetadata(for: url) { (metadata, error) in
            guard error == nil else {
//                assertionFailure("Error")
                return
            }
            DispatchQueue.main.async {
                self.metadata = metadata
            }
            guard let imageProvider = metadata?.imageProvider else { return }
            imageProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                guard error == nil else {
                    // handle error
                    return
                }
                if let image = image as? UIImage {
                    // do something with image
                    DispatchQueue.main.async {
                        self.image = image
                    }
                } else {
                    print("no image available")
                }
            }
        }
    }
}

struct MetadataView : View {
    @StateObject var vm : LinkViewModel
    
    var body: some View {
        HStack {
            Image(uiImage: vm.image ?? UIImage(imageLiteralResourceName: "placeholder"))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .cornerRadius(12)
            if let metadata = vm.metadata {
                VStack(alignment: .leading, spacing: 6) {
                    Text(vm.urlString ?? "")
                        .font(.mulish(.light, 10))
                        .lineLimit(1)
                        .truncationMode(.middle)
                    Text(metadata.title ?? "")
                        .font(.mulish(.semiBold, 16))
                        .lineLimit(2)
                }
                .foregroundColor(.primary)
                .padding(.top, 2)
                .padding(.leading, 10)
            }
            Spacer()
           
        }
//        .background(Color(hex: "#D9D9D9"))
        .cornerRadius(12)
    }
}


struct MetadataView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MetadataView(vm: LinkViewModel(link: "https://freeicons.io/business-and-online-icons/plus-icon-icon-2"))
            MetadataView(vm: LinkViewModel(link: "https://www.google.com"))
        }
            .previewLayout(.sizeThatFits)
    }
}
