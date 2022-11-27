//
//  CustomTextPicker.swift
//  TrackLink
//
//  Created by Can Yoldaş on 21.11.2022.
//

import SwiftUI

protocol PickerSelectable: Hashable {
    var name: String { get }
}

struct CustomTextPicker<T>: View where T: PickerSelectable {
    
    @State private var width = CGFloat.zero
    @State private var labelWidth = CGFloat.zero
    let title: String
    var items: [T]
    @Binding var selectedItem: T?
    
    var body: some View {
        HStack {
        
            Menu {
                Picker(selection: $selectedItem, label: EmptyView()) {
                    ForEach(items, id: \.self) {
                        Text($0.name)
                    }
                }
                .pickerStyle(.automatic)
                .padding(.vertical, 5)
            } label: {
                HStack {
                    Text(selectedItem?.name ?? "")
                        .padding(.leading, 10)
                        .foregroundColor(.secondary)
                        .font(.mulish(.light, 14))
                    Spacer()
                    Image(systemName: "chevron.down")
                }
            }
            }
                .foregroundColor(.secondary)
                .font(.system(size: 20))
                .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                .background {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .trim(from: 0, to: 0.55)
                            .stroke(.gray, lineWidth: 1)
                        RoundedRectangle(cornerRadius: 5)
                            .trim(from: 0.565 + (0.44 * (labelWidth / width)), to: 1)
                            .stroke(.gray, lineWidth: 1)
                        Text(title)
                            .foregroundColor(.gray)
                            .overlay( GeometryReader { geo in Color.clear.onAppear { labelWidth = geo.size.width }})
                            .padding(2)
                            .font(.caption)
                            .frame(maxWidth: .infinity,
                                   maxHeight: .infinity,
                                   alignment: .topLeading)
                            .offset(x: 20, y: -10)
                    }
                }
                .overlay( GeometryReader { geo in Color.clear.onAppear { width = geo.size.width }})
                .onChange(of: width) { _ in
                    print("Width: ", width)
                }
                .onChange(of: labelWidth) { _ in
                    print("labelWidth: ", labelWidth)
                }
        }
    }

struct CustomTextPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextPicker(title: "Selection", items: ItemType.allCases, selectedItem: .constant(.item))
            .previewLayout(.sizeThatFits)
    }
}
