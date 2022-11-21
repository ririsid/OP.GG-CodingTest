//
//  Color.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/17.
//

import SwiftUI

extension Color {

    static var paleGrey: Color {
        Color(uiColor: UIColor(red: 247.0 / 255.0, green: 247.0 / 255.0, blue: 249.0 / 255.0, alpha: 1.0))
    }

    static var coolGrey: Color {
        Color(uiColor: UIColor(red: 152.0 / 255.0, green: 160.0 / 255.0, blue: 167.0 / 255.0, alpha: 1.0))
    }

    static var greenBlue: Color {
        Color(uiColor: UIColor(red: 10.0 / 255.0, green: 197.0 / 255.0, blue: 142.0 / 255.0, alpha: 1.0))
    }

    static var darkishPink: Color {
        Color(uiColor: UIColor(red: 232.0 / 255.0, green: 64.0 / 255.0, blue: 87.0 / 255.0, alpha: 1.0))
    }

    static var steelGrey: Color {
        Color(uiColor: UIColor(red: 123.0 / 255.0, green: 133.0 / 255.0, blue: 142.0 / 255.0, alpha: 1.0))
    }

    static var orangeYellow: Color {
        Color(uiColor: UIColor(red: 1.0, green: 169.0 / 255.0, blue: 5.0 / 255.0, alpha: 1.0))
    }

    static var gunmetal: Color {
        Color(uiColor: UIColor(red: 82.0 / 255.0, green: 89.0 / 255.0, blue: 95.0 / 255.0, alpha: 1.0))
    }

    static var periwinkle: Color {
        Color(uiColor: UIColor(red: 139.0 / 255.0, green: 104.0 / 255.0, blue: 1.0, alpha: 1.0))
    }

    static var darkGrey90: Color {
        Color(uiColor: UIColor(red: 30.0 / 255.0, green: 32.0 / 255.0, blue: 34.0 / 255.0, alpha: 0.9))
    }

    static var paleGreyTwo: Color {
        Color(uiColor: UIColor(red: 235.0 / 255.0, green: 238.0 / 255.0, blue: 241.0 / 255.0, alpha: 1.0))
    }

    static var darkGrey: Color {
        Color(uiColor: UIColor(red: 30.0 / 255.0, green: 32.0 / 255.0, blue: 34.0 / 255.0, alpha: 1.0))
    }

    static var softBlue: Color {
        Color(uiColor: UIColor(red: 83.0 / 255.0, green: 131.0 / 255.0, blue: 232.0 / 255.0, alpha: 1.0))
    }
}

extension ShapeStyle where Self == Color {

    static var paleGrey: Color { .paleGrey }
    static var coolGrey: Color { .coolGrey }
    static var greenBlue: Color { .greenBlue }
    static var darkishPink: Color { .darkishPink }
    static var steelGrey: Color { .steelGrey }
    static var orangeYellow: Color { .orangeYellow }
    static var gunmetal: Color { .gunmetal }
    static var periwinkle: Color { .periwinkle }
    static var darkGrey90: Color { .darkGrey90 }
    static var paleGreyTwo: Color { .paleGreyTwo }
    static var darkGrey: Color { .darkGrey }
    static var softBlue: Color { .softBlue }
}
