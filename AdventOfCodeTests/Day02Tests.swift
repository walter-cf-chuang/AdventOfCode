//
//  Day02Tests.swift
//  AdventOfCodeTests
//
//  Created by Walter on 2022/12/4.
//

import XCTest
@testable import AdventOfCode

class Day02Tests: XCTestCase {

    func testPart1() {
        let sut = Day02()
        XCTAssertEqual(sut.part1(), "13682")
    }

    func testPart2() {
        let sut = Day02()
        XCTAssertEqual(sut.part2(), "12881")
    }
}
