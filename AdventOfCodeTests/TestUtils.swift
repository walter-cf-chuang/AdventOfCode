//
//  TestUtils.swift
//  AdventOfCodeTests
//
//  Created by Walter on 2022/12/4.
//

import Foundation
@testable import AdventOfCode

func printTestInfo(testClass: Day.Type, testPart: TestPart, inputSource: String, expectedOutput: String) {
    print("\tRunning \(testClass).\(testPart)() with inputSource = \(inputSource), expectedOutput = \(expectedOutput)")
}
