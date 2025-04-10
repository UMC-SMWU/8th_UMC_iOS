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
        case black00, black01, black02, black03
        
        // MARK: - Blue
        case blue01
        
        // MARK: - Brown
        case brown01, brown02
        
        // MARK: - Gray
        case gray00, gray01, gray02, gray03, gray04, gray05, gray06, gray07
        
        // MARK: - Green
        case green00, green01, green02, green03
        
        // MARK: - Red
        case red01
        
        // MARK: - White
        case white00, white01

        var value: Color {
            switch self {
            case .black00: return StarbucksAsset.Colors.black00.swiftUIColor
            case .black01: return StarbucksAsset.Colors.black01.swiftUIColor
            case .black02: return StarbucksAsset.Colors.black02.swiftUIColor
            case .black03: return StarbucksAsset.Colors.black03.swiftUIColor

            case .blue01: return StarbucksAsset.Colors.blue01.swiftUIColor

            case .brown01: return StarbucksAsset.Colors.brown01.swiftUIColor
            case .brown02: return StarbucksAsset.Colors.brown02.swiftUIColor

            case .gray00: return StarbucksAsset.Colors.gray00.swiftUIColor
            case .gray01: return StarbucksAsset.Colors.gray01.swiftUIColor
            case .gray02: return StarbucksAsset.Colors.gray02.swiftUIColor
            case .gray03: return StarbucksAsset.Colors.gray03.swiftUIColor
            case .gray04: return StarbucksAsset.Colors.gray04.swiftUIColor
            case .gray05: return StarbucksAsset.Colors.gray05.swiftUIColor
            case .gray06: return StarbucksAsset.Colors.gray06.swiftUIColor
            case .gray07: return StarbucksAsset.Colors.gray07.swiftUIColor

            case .green00: return StarbucksAsset.Colors.green00.swiftUIColor
            case .green01: return StarbucksAsset.Colors.green01.swiftUIColor
            case .green02: return StarbucksAsset.Colors.green02.swiftUIColor
            case .green03: return StarbucksAsset.Colors.green03.swiftUIColor

            case .red01: return StarbucksAsset.Colors.red01.swiftUIColor

            case .white00: return StarbucksAsset.Colors.white00.swiftUIColor
            case .white01: return StarbucksAsset.Colors.white01.swiftUIColor
            }
        }
    }

    // MARK: - Black
    static var black00: Color { StarbucksColor.black00.value }
    static var black01: Color { StarbucksColor.black01.value }
    static var black02: Color { StarbucksColor.black02.value }
    static var black03: Color { StarbucksColor.black03.value }

    // MARK: - Blue
    static var blue01: Color { StarbucksColor.blue01.value }

    // MARK: - Brown
    static var brown01: Color { StarbucksColor.brown01.value }
    static var brown02: Color { StarbucksColor.brown02.value }

    // MARK: - Gray
    static var gray00: Color { StarbucksColor.gray00.value }
    static var gray01: Color { StarbucksColor.gray01.value }
    static var gray02: Color { StarbucksColor.gray02.value }
    static var gray03: Color { StarbucksColor.gray03.value }
    static var gray04: Color { StarbucksColor.gray04.value }
    static var gray05: Color { StarbucksColor.gray05.value }
    static var gray06: Color { StarbucksColor.gray06.value }
    static var gray07: Color { StarbucksColor.gray07.value }

    // MARK: - Green
    static var green00: Color { StarbucksColor.green00.value }
    static var green01: Color { StarbucksColor.green01.value }
    static var green02: Color { StarbucksColor.green02.value }
    static var green03: Color { StarbucksColor.green03.value }

    // MARK: - Red
    static var red01: Color { StarbucksColor.red01.value }

    // MARK: - White
    static var white00: Color { StarbucksColor.white00.value }
    static var white01: Color { StarbucksColor.white01.value }
}
