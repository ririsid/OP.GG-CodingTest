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

    static var steelGrey: Color {
        Color(uiColor: UIColor(red: 123.0 / 255.0, green: 133.0 / 255.0, blue: 142.0 / 255.0, alpha: 1.0))
    }

    static var darkGrey90: Color {
        Color(uiColor: UIColor(red: 30.0 / 255.0, green: 32.0 / 255.0, blue: 34.0 / 255.0, alpha: 0.9))
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
    static var steelGrey: Color { .steelGrey }
    static var darkGrey90: Color { .darkGrey90 }
    static var darkGrey: Color { .darkGrey }
    static var softBlue: Color { .softBlue }
}
