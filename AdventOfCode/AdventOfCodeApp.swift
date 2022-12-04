//
//  AdventOfCodeApp.swift
//  AdventOfCode
//
//  Created by Walter on 2022/12/4.
//

import SwiftUI

@main
struct AdventOfCodeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    init() {
        getOutputs()
    }

    private func getOutputs() {
        let day = Day01()
        print("Day01 - 1 = \(day.part1())")
        print("Day01 - 2 = \(day.part2())")
    }
}
