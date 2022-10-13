//
//  CalculatorApp.swift
//  Calculator
//
//  Created by wjc on 2022/10/13.
//

import SwiftUI

@main
struct CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CalculatorModel())
        }
    }
}
