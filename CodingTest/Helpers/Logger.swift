//
//  Logger.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/17.
//

import Foundation
import os

// 로거 래퍼(Wrapper)
final class Logger {

    static let `default`: os.Logger = os.Logger(subsystem: OSLog.subsystem, category: "Default")
    static let network: os.Logger = os.Logger(subsystem: OSLog.subsystem, category: "Network")

    private init() {}
}

extension OSLog {

    static let subsystem = Bundle.main.bundleIdentifier!
}
