//
//  Day04.swift
//  AdventOfCode
//
//  Created by Walter on 2022/12/4.
//

import Foundation

final class Day04: Day {

    private let inputString: String

    init(inputSource: InputSource) {
        inputString = inputSource.inputString
    }

    func part1() -> String {

        /*
         2-4,6-8
         2-3,4-5
         5-7,7-9
         2-8,3-7
         6-6,4-6
         2-6,4-8
         */

        return findDuplicatePairs(by: hasFullyContain)
    }

    func part2() -> String {
        return findDuplicatePairs(by: hasOverlap)
    }

    private func findDuplicatePairs(by predicate: ([ClosedRange<Int>]) -> Bool) -> String {
        return inputString
            .split(separator: "\n") // ["2-4,6-8", "2-3,4-5", "5-7,7-9", ...]
            .map(parse) // [["2-4", "6-8"], ["2-3", "4-5"], ["5-7", "7-9"], ...] -> [[(2, 4), (6, 8)], [(2, 3), (4, 5)], [(5, 7), (7, 9)], ...]
            .filter(predicate)
            .count
            .description
    }

    private func hasFullyContain(ranges: [ClosedRange<Int>]) -> Bool {
        /*
            [(2, 4), (6, 8)]
            -> false

            [(2, 8), (3, 7)]
            -> true
        */

        return ranges[0].contains(ranges[1]) || ranges[1].contains(ranges[0])
    }

    private func hasOverlap(ranges: [ClosedRange<Int>]) -> Bool {
        /*
            [(2, 4), (6, 8)]
            -> false

            [(2, 6), (4, 8)]
            -> true
        */

        return ranges[0].overlaps(ranges[1])
    }

    private func parse(line: Substring) -> [ClosedRange<Int>] {
        // "2-4,6-8"
        // -> ["2-4", "6-8"]
        // -> [[2, 4], [6, 8]]
        // -> [2...4, 6...8]
//        return str
//            .split(separator: ",") // ["2-4", "6-8"]
//            .map({
//                $0 // "2-4"
//                    .split(separator: "-") // ["2", "4"]
//                    .map({ Int($0)! }) // [2, 4]
//            }) // [[2, 4], [6, 8]]
//            .map({ $0[0]...$0[1] })
        let numbers = line.split(whereSeparator: { !$0.isNumber }).map({ Int($0)! }) // "2-4,6-8" -> [2, 4, 6, 8]
        return [numbers[0]...numbers[1], numbers[2]...numbers[3]]
    }
}

private extension ClosedRange {

    func contains(_ other: ClosedRange) -> Bool {
//        return (upperBound >= other.upperBound && lowerBound <= other.lowerBound) ||
//               (other.upperBound >= upperBound && other.lowerBound <= lowerBound)
        return other.clamped(to: self) == other
    }
}
