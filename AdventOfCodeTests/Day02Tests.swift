//
//  Day02Tests.swift
//  AdventOfCodeTests
//
//  Created by Walter on 2022/12/4.
//

import XCTest
@testable import AdventOfCode

class Day02Tests: XCTestCase {

    private enum Input {
        static let testString = "C Z\nC Y\nA X\nC X"
        static let realFilename = "input_02"
    }

    private enum Output {
        static let expectedPart1ForTestString = "19"
        static let expectedPart2ForTestString = "18"
        static let expectedPart1ForRealFile = "13682"
        static let expectedPart2ForRealFile = "12881"
    }

    private enum Log {
        static let sutName = String(describing: Day02.self)
    }

    private let testInputSource = TestInputSource.all

    func testPart1() {
        let testPart = TestPart.part1
        let sutSuites = makeSUT(testPart: testPart)

        for (sut, inputSource, expectedOutput) in sutSuites {
            print("\tRunning \(Log.sutName).\(testPart)() with inputSource = \(inputSource), expectedOutput = \(expectedOutput)")
            XCTAssertEqual(sut.part1(), expectedOutput)
        }
    }

    func testPart2() {
        let testPart = TestPart.part2
        let sutSuites = makeSUT(testPart: testPart)

        for (sut, inputSource, expectedOutput) in sutSuites {
            print("\tRunning \(Log.sutName).\(testPart)() with inputSource = \(inputSource), expectedOutput = \(expectedOutput)")
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
            return [(Day02(inputSource: inputSource), "\(inputSource)", expectedOutputForTestString)]
        case .file:
            let inputSource = InputSource.file(Input.realFilename)
            return [(Day02(inputSource: inputSource), "\(inputSource)", expectedOutputForRealFile)]
        case .all:
            let inputSourceTestString = InputSource.string(Input.testString)
            let inputSourceRealFile = InputSource.file(Input.realFilename)
            return [(Day02(inputSource: inputSourceTestString), "\(inputSourceTestString)", expectedOutputForTestString),
                    (Day02(inputSource: inputSourceRealFile), "\(inputSourceRealFile)", expectedOutputForRealFile)]
        }
    }
}
