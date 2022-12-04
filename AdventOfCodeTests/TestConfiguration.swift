//
//  TestConfiguration.swift
//  AdventOfCodeTests
//
//  Created by Walter on 2022/12/4.
//

import XCTest
@testable import AdventOfCode

enum TestInputSource {
    case string
    case file
    case all
}

enum TestPart {
    case part1
    case part2
}

protocol DayTests: XCTestCase {

    // Inputs
    var inputTestClass: Day.Type { get }
    var inputTestString: String { get }
    var inputRealFilename: String { get }

    // Outputs
    var outputExpectedPart1ForTestString: String { get }
    var outputExpectedPart2ForTestString: String { get }
    var outputExpectedPart1ForRealFile: String { get }
    var outputExpectedPart2ForRealFile: String { get }

    // Test source
    var testInputSource: TestInputSource { get }

    func makeSUT(testPart: TestPart) -> [(sut: Day, inputSource: String, expectedOutput: String)]
}

extension DayTests {

    func makeSUT(testPart: TestPart) -> [(sut: Day, inputSource: String, expectedOutput: String)] {

        let expectedOutputForTestString: String = {
            switch testPart {
            case .part1:
                return outputExpectedPart1ForTestString
            case .part2:
                return outputExpectedPart2ForTestString
            }
        }()

        let expectedOutputForRealFile: String = {
            switch testPart {
            case .part1:
                return outputExpectedPart1ForRealFile
            case .part2:
                return outputExpectedPart2ForRealFile
            }
        }()

        switch testInputSource {
        case .string:
            let inputSource = InputSource.string(inputTestString)
            return [(inputTestClass.init(inputSource: inputSource), "\(inputSource)", expectedOutputForTestString)]
        case .file:
            let inputSource = InputSource.file(inputRealFilename)
            return [(inputTestClass.init(inputSource: inputSource), "\(inputSource)", expectedOutputForRealFile)]
        case .all:
            let inputSourceTestString = InputSource.string(inputTestString)
            let inputSourceRealFile = InputSource.file(inputRealFilename)
            return [(inputTestClass.init(inputSource: inputSourceTestString), "\(inputSourceTestString)", expectedOutputForTestString),
                    (inputTestClass.init(inputSource: inputSourceRealFile), "\(inputSourceRealFile)", expectedOutputForRealFile)]
        }
    }
}
