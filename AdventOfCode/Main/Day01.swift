//
//  Day01.swift
//  AdventOfCode
//
//  Created by Walter on 2022/12/4.
//

import Foundation

final class Day01 {

    var inputString: String {
        let fileURL = Bundle.main.url(forResource: "input_01", withExtension: "txt")
        guard let fileURL = fileURL else {
            assertionFailure("Input file not found.")
            return ""
        }

        do {
            return try String(contentsOf: fileURL, encoding: String.Encoding.utf8)
        } catch {
            assertionFailure("Cannot convert data in file to String.")
        }

        return ""
    }

    func part1() -> String {
        return sortedCalories.first!.description
    }

    func part2() -> String {
        return sortedCalories
            .prefix(3)
            .reduce(into: 0, { result, num in
                result += num
            })
            .description
    }

    private var sortedCalories: [Int] {
        let inputSets = inputString.components(separatedBy: "\n\n")

        // ["3\n7\n2", "21\n33\n1, "1\n2\n3"]
        let calories = inputSets
            .map({ inputSet in

                // inputSet: "21\n33\n1"
                inputSet
                    .components(separatedBy: "\n") // ["21", "33", "1"]
                    .reduce(0, { cnt, numStr in // initial: 0, cnt: 0, numStr: "21" -> cnt: 21, numStr: "33" -> cnt: 54, numStr: 1 -> 55
                        return cnt + (Int(numStr) ?? 0)
                    })
            }) // [12, 54, 6]

        return calories.sorted(by: >) // [54, 12, 6]
    }
}
