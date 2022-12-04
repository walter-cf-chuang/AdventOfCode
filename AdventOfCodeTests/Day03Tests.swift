//
//  Day03Tests.swift
//  AdventOfCodeTests
//
//  Created by Walter on 2022/12/4.
//

import XCTest
@testable import AdventOfCode

class Day03Tests: XCTestCase, DayTests {

    // Inputs
    let inputTestClass: Day.Type = Day03.self
    let inputTestString: String =
"""
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""
    let inputRealFilename: String = "input_03"

    // Outputs
    let outputExpectedPart1ForTestString: String = "157"
    let outputExpectedPart2ForTestString: String = "70"
    let outputExpectedPart1ForRealFile: String = "7763"
    let outputExpectedPart2ForRealFile: String = "2569"

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
