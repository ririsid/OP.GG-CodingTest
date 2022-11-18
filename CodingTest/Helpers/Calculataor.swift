//
//  Calculataor.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/18.
//

import Foundation

final class Calculator {

    private init() {}

    /// 승률 (Double)
    ///
    /// 승수 / (승수 + 패수)
    static func winningPercentage(wins: Int, losses: Int) -> Double {
        Double(wins) / Double(wins + losses)
    }

    /// 승률 (String)
    ///
    /// 승수 / (승수 + 패수)
    static func winningPercentage(wins: Int, losses: Int) -> String {
        let value: Double = winningPercentage(wins: wins, losses: losses)
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }

    /// KDA 공식
    ///
    /// (kills + assists) / deaths
    static func kdaPercentage(kills: Int, deaths: Int, assists: Int) -> Double {
        Double(kills + assists) / Double(deaths)
    }

    /// KDA 공식
    ///
    /// (kills + assists) / deaths
    static func kdaPercentage(kills: Int, deaths: Int, assists: Int) -> String {
        let value: Double = kdaPercentage(kills: kills, deaths: deaths, assists: assists)
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 0
        return formatter.string(from: NSNumber(value: value)) ?? ""
    }
}
