//
//  Day03Tests.swift
//  AdventOfCodeTests
//
//  Created by Walter on 2022/12/4.
//

import XCTest
@testable import AdventOfCode

class Day03Tests: XCTestCase {

    private enum Input {
        static let testClass: Day.Type = Day03.self
        static let testString =
"""
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
"""
        static let realFilename = "input_03"
    }

    private enum Output {
        static let expectedPart1ForTestString = "157"
        static let expectedPart2ForTestString = "70"
        static let expectedPart1ForRealFile = "7763"
        static let expectedPart2ForRealFile = "2569"
    }

    private let testInputSource = TestInputSource.all

    func testPart1() {
        let testPart = TestPart.part1
        let sutSuites = makeSUT(testPart: testPart)

        for (sut, inputSource, expectedOutput) in sutSuites {
            printTestInfo(testClass: Input.testClass, testPart: testPart, inputSource: inputSource, expectedOutput: expectedOutput)
            XCTAssertEqual(sut.part1(), expectedOutput)
        }
    }

    func testPart2() {
        let testPart = TestPart.part2
        let sutSuites = makeSUT(testPart: testPart)

        for (sut, inputSource, expectedOutput) in sutSuites {
            printTestInfo(testClass: Input.testClass, testPart: testPart, inputSource: inputSource, expectedOutput: expectedOutput)
            XCTAssertEqual(sut.part2(), expectedOutput)
        }
    }

    private func makeSUT(testPart: TestPart) -> [(sut: Day, inputSource: String, expectedOutput: String)] {

        let expectedOutputForTestString: String = {
            switch testPart {
            case .part1:
                return Output.expectedPart1ForTestString
            case .part2:
                return Output.expectedPart2ForTestString
            }
        }()

        let expectedOutputForRealFile: String = {
            switch testPart {
            case .part1:
                return Output.expectedPart1ForRealFile
            case .part2:
                return Output.expectedPart2ForRealFile
            }
        }()

        switch testInputSource {
        case .string:
            let inputSource = InputSource.string(Input.testString)
            return [(Input.testClass.init(inputSource: inputSource), "\(inputSource)", expectedOutputForTestString)]
        case .file:
            let inputSource = InputSource.file(Input.realFilename)
            return [(Input.testClass.init(inputSource: inputSource), "\(inputSource)", expectedOutputForRealFile)]
        case .all:
            let inputSourceTestString = InputSource.string(Input.testString)
            let inputSourceRealFile = InputSource.file(Input.realFilename)
            return [(Input.testClass.init(inputSource: inputSourceTestString), "\(inputSourceTestString)", expectedOutputForTestString),
                    (Input.testClass.init(inputSource: inputSourceRealFile), "\(inputSourceRealFile)", expectedOutputForRealFile)]
        }
    }
}
