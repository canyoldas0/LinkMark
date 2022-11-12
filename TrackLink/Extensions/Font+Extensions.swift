//
//  CustomFont.swift
//  JetQuiz
//
//  Created by Can Yoldaş on 29.10.2022.
//

import SwiftUI

extension Font {
    enum MulishFont: String {
        case regular
        case medium
        case light
        case bold
        case semiBold
        case black
        case extraBold
        
        var value: String {
            switch self {
            case .extraBold:
                return "Mulish-ExtraBold"
            default:
                return "Mulish-\(rawValue.capitalized)"
                //            case .regular:
                //                return "Mulish-Regular"
                //            case .semibold:
                //                return "Mulish-SemiBold"
                //            case .bold:
                //                return "Mulish-Bold"
                //            case .medium:
                //                return "Mulish-Medium"
                //            case .light:
                //                return "Mulish-Light"
                //            case .black:
                //                return "Mulish-\(rawValue)"
                //            }
                //        }
            }
        }
    }
    
    static func mulish(_ type: MulishFont, _ size: CGFloat = 16) -> Font {
        return .custom(type.value, size: size)
    }
}
