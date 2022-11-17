//
//  Color.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/17.
//

import SwiftUI

extension Color {

    static var darkGrey: Color {
        Color(uiColor: UIColor(red: 30.0 / 255.0, green: 32.0 / 255.0, blue: 34.0 / 255.0, alpha: 1.0))
    }

    static var darkGrey90: Color {
        Color(uiColor: UIColor(red: 30.0 / 255.0, green: 32.0 / 255.0, blue: 34.0 / 255.0, alpha: 0.9))
    }

    static var softBlue: Color {
        Color(uiColor: UIColor(red: 83.0 / 255.0, green: 131.0 / 255.0, blue: 232.0 / 255.0, alpha: 1.0))
    }
}
