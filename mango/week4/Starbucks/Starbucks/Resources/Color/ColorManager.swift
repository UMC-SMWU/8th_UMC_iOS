//
//  ColorManager.swift
//  Starbucks
//
//  Created by 엄민서 on 3/22/25.
//

import SwiftUI

extension Color {
    enum StarbucksColor {
        // MARK: - Black
        case black00, black01, black02, black03, black04
        
        // MARK: - Blue
        case blue01
        
        // MARK: - Brown
        case brown01, brown02
        
        // MARK: - Gray
        case gray00, gray01, gray02, gray03, gray04, gray05, gray06, gray07, gray08, gray09, gray10, gray11
        
        // MARK: - Green
        case green00, green01, green02, green03, green04
        
        // MARK: - Red
        case red01
        
        // MARK: - White
        case white00, white01
        
        // MARK: - Yellow
        case yellow01

        var value: Color {
            switch self {
            case .black00: return Color("black00")
            case .black01: return Color("black01")
            case .black02: return Color("black02")
            case .black03: return Color("black03")
            case .black04: return Color("black04")

            case .blue01: return Color("blue01")

            case .brown01: return Color("brown01")
            case .brown02: return Color("brown02")

            case .gray00: return Color("gray00")
            case .gray01: return Color("gray01")
            case .gray02: return Color("gray02")
            case .gray03: return Color("gray03")
            case .gray04: return Color("gray04")
            case .gray05: return Color("gray05")
            case .gray06: return Color("gray06")
            case .gray07: return Color("gray07")
            case .gray08: return Color("gray08")
            case .gray09: return Color("gray09")
            case .gray10: return Color("gray10")
            case .gray11: return Color("gray11")

            case .green00: return Color("green00")
            case .green01: return Color("green01")
            case .green02: return Color("green02")
            case .green03: return Color("green03")
            case .green04: return Color("green04")

            case .red01: return Color("red01")

            case .white00: return Color("white00")
            case .white01: return Color("white01")
                
            case .yellow01: return Color("yellow01")
            }
        }
    }

    // MARK: - Black
    
    static let black00 = StarbucksColor.black00.value
    static let black01 = StarbucksColor.black01.value
    static let black02 = StarbucksColor.black02.value
    static let black03 = StarbucksColor.black03.value
    static let black04 = StarbucksColor.black04.value

    // MARK: - Blue
    static let blue01 = StarbucksColor.blue01.value

    // MARK: - Brown
    static let brown01 = StarbucksColor.brown01.value
    static let brown02 = StarbucksColor.brown02.value

    // MARK: - Gray
    static let gray00 = StarbucksColor.gray00.value
    static let gray01 = StarbucksColor.gray01.value
    static let gray02 = StarbucksColor.gray02.value
    static let gray03 = StarbucksColor.gray03.value
    static let gray04 = StarbucksColor.gray04.value
    static let gray05 = StarbucksColor.gray05.value
    static let gray06 = StarbucksColor.gray06.value
    static let gray07 = StarbucksColor.gray07.value
    static let gray08 = StarbucksColor.gray08.value
    static let gray09 = StarbucksColor.gray09.value
    static let gray10 = StarbucksColor.gray10.value
    static let gray11 = StarbucksColor.gray10.value

    // MARK: - Green
    static let green00 = StarbucksColor.green00.value
    static let green01 = StarbucksColor.green01.value
    static let green02 = StarbucksColor.green02.value
    static let green03 = StarbucksColor.green03.value
    static let green04 = StarbucksColor.green04.value

    // MARK: - Red
    static let red01 = StarbucksColor.red01.value

    // MARK: - White
    static let white00 = StarbucksColor.white00.value
    static let white01 = StarbucksColor.white01.value
    
    // MARK: - Yellow
    static let yellow01 = StarbucksColor.yellow01.value
}
