//
//  Day02Tests.swift
//  AdventOfCodeTests
//
//  Created by Walter on 2022/12/4.
//

import XCTest
@testable import AdventOfCode

class Day02Tests: XCTestCase, DayTests {

    // Inputs
    let inputTestClass: Day.Type = Day02.self
    let inputTestString: String = "C Z\nC Y\nA X\nC X"
    let inputRealFilename: String = "input_02"

    // Outputs
    let outputExpectedPart1ForTestString: String = "19"
    let outputExpectedPart2ForTestString: String = "18"
    let outputExpectedPart1ForRealFile: String = "13682"
    let outputExpectedPart2ForRealFile: String = "12881"

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
