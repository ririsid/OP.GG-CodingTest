//
//  CodingTestApp.swift
//  CodingTest
//
//  Created by 박정연 on 2022/11/16.
//

import SwiftUI

import ComposableArchitecture

@main
struct CodingTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(store: .init(
                initialState: AppReducer.State(),
                reducer: AppReducer()
            ))
        }
    }
}
