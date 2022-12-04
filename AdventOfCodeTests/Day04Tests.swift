//
//  Day04Tests.swift
//  AdventOfCodeTests
//
//  Created by Walter on 2022/12/4.
//

import XCTest
@testable import AdventOfCode

class Day04Tests: XCTestCase, DayTests {

    // Inputs
    let inputTestClass: Day.Type = Day04.self
    let inputTestString: String =
"""
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
"""
    let inputRealFilename: String = "input_04"

    // Outputs
    let outputExpectedPart1ForTestString: String = "2"
    let outputExpectedPart2ForTestString: String = "4"
    let outputExpectedPart1ForRealFile: String = "500"
    let outputExpectedPart2ForRealFile: String = "815"

    // Test source
    let testInputSource = TestInputSource.all

    func testPart1() {
        let testPart = TestPart.part1
        let sutSuites = makeSUT(testPart: testPart)

        for (sut, inputSource, expectedOutput) in sutSuites {
            printTestInfo(testClass: inputTestClass, testPart: testPart, inputSource: inputSource, expectedOutput: expectedOutput)
            XCTAssertEqual(sut.part1(), expectedOutput)
        }
    }

    func testPart2() {
        let testPart = TestPart.part2
        let sutSuites = makeSUT(testPart: testPart)

        for (sut, inputSource, expectedOutput) in sutSuites {
            printTestInfo(testClass: inputTestClass, testPart: testPart, inputSource: inputSource, expectedOutput: expectedOutput)
            XCTAssertEqual(sut.part2(), expectedOutput)
        }
    }
}
