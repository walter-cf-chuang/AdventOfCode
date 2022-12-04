//
//  Day01Tests.swift
//  AdventOfCodeTests
//
//  Created by Walter on 2022/12/4.
//

import XCTest
@testable import AdventOfCode

class Day01Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPart1() {
        let sut = Day01()
        XCTAssertEqual(sut.part1(), "70698")
    }

    func testPart2() {
        let sut = Day01()
        XCTAssertEqual(sut.part2(), "206643")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {

        }
    }
}
