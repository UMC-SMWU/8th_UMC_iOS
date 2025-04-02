//
//  FontManager.swift
//  Starbucks
//
//  Created by 엄민서 on 3/22/25.
//

import SwiftUI
import Foundation

extension Font {
    enum PretendardFont {
        case extraBold
        case bold
        case semiBold
        case medium
        case regular
        case light

        var value: String {
            switch self {
            case .extraBold: return "Pretendard-ExtraBold"
            case .bold: return "Pretendard-Bold"
            case .semiBold: return "Pretendard-SemiBold"
            case .medium: return "Pretendard-Medium"
            case .regular: return "Pretendard-Regular"
            case .light: return "Pretendard-Light"
            }
        }

        func font(size: CGFloat) -> Font {
            return .custom(self.value, size: size)
        }
    }

    // MARK: MainText - ExtraBold
    static var mainTextExtraBold24: Font {
        return PretendardFont.extraBold.font(size: 24)
    }

    // MARK: MainText - Bold
    static var mainTextBold24: Font {
        return PretendardFont.bold.font(size: 24)
    }

    static var mainTextBold20: Font {
        return PretendardFont.bold.font(size: 20)
    }
    
    static var mainTextBold15: Font {
        return PretendardFont.bold.font(size: 15)
    }

    // MARK: MainText - SemiBold
    static var mainTextSemiBold38: Font {
        return PretendardFont.semiBold.font(size: 38)
    }
    
    static var mainTextSemiBold24: Font {
        return PretendardFont.semiBold.font(size: 24)
    }
    
    static var mainTextSemiBold18: Font {
        return PretendardFont.semiBold.font(size: 18)
    }

    static var mainTextSemiBold16: Font {
        return PretendardFont.semiBold.font(size: 16)
    }

    static var mainTextSemiBold14: Font {
        return PretendardFont.semiBold.font(size: 14)
    }
    
    static var mainTextSemiBold13: Font {
        return PretendardFont.semiBold.font(size: 13)
    }
    
    // MARK: MainText - Medium
    static var mainTextMedium18: Font {
        return PretendardFont.medium.font(size: 18)
    }
    
    static var mainTextMedium16: Font {
        return PretendardFont.medium.font(size: 16)
    }
    
    static var mainTextMedium12: Font {
        return PretendardFont.medium.font(size: 12)
    }

    // MARK: MainText - Regular
    static var mainTextRegular18: Font {
        return PretendardFont.regular.font(size: 18)
    }

    static var mainTextRegular13: Font {
        return PretendardFont.regular.font(size: 13)
    }

    static var mainTextRegular12: Font {
        return PretendardFont.regular.font(size: 12)
    }

    static var mainTextRegular09: Font {
        return PretendardFont.regular.font(size: 9)
    }

    // MARK: MainText - Light
    static var mainTextLight24: Font {
        return PretendardFont.light.font(size: 24)
    }

    static var mainTextLight14: Font {
        return PretendardFont.light.font(size: 14)
    }

    // MARK: ButtonText - Medium
    static var buttonTextMedium18: Font {
        return PretendardFont.medium.font(size: 18)
    }
}
