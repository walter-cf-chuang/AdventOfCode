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

    private func findDuplicatePairs(by predicate: ([(lowerbound: Int, upperbound: Int)]) -> Bool) -> String {
        return inputString
            .split(separator: "\n") // ["2-4,6-8", "2-3,4-5", "5-7,7-9", ...]
            .map({ $0.split(separator: ",").map({ $0.range }) }) // [["2-4", "6-8"], ["2-3", "4-5"], ["5-7", "7-9"], ...] -> [[(2, 4), (6, 8)], [(2, 3), (4, 5)], [(5, 7), (7, 9)], ...]
            .filter(predicate)
            .count
            .description
    }

    private func hasFullyContain(ranges: [(lowerbound: Int, upperbound: Int)]) -> Bool {
        /*
            [(2, 4), (6, 8)]
            -> false

            [(2, 8), (3, 7)]
            -> true
        */

        return (ranges[0].upperbound >= ranges[1].upperbound && ranges[0].lowerbound <= ranges[1].lowerbound) ||
               (ranges[1].upperbound >= ranges[0].upperbound && ranges[1].lowerbound <= ranges[0].lowerbound)
    }

    private func hasOverlap(ranges: [(lowerbound: Int, upperbound: Int)]) -> Bool {
        /*
            [(2, 4), (6, 8)]
            -> false

            [(2, 6), (4, 8)]
            -> true
        */

        return ranges[0].upperbound >= ranges[1].lowerbound && ranges[1].upperbound >= ranges[0].lowerbound
    }
}

private extension Substring {

    var range: (lowerbound: Int, upperbound: Int) {
        // 2-4 -> 2, 4
        let nums = split(separator: "-").map({ Int($0)! })
        return (nums[0], nums[1])
    }
}
