//
//  Configurations.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/16.
//

import Foundation

// [Reference](https://nshipster.com/xcconfig/)
private enum Configuration {

    enum Error: Swift.Error {
        case missingKey, invalidValue
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey:key) else {
            throw Error.missingKey
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
}

enum Configurations {}

extension Configurations {

    enum API {
        static var baseURL: URL { try! URL(string: Configuration.value(for: "API_BASE_URL"))! }
    }
}
