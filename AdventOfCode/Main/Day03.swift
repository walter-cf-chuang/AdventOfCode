//
//  Day03.swift
//  AdventOfCode
//
//  Created by Walter on 2022/12/4.
//

import Foundation

final class Day03: Day {

    private let inputString: String

    init(inputSource: InputSource) {
        inputString = inputSource.inputString
    }

    func part1() -> String {

        /*

         let inputStrTest =
         """
         vJrwpWtwJgWrhcsFMMfFFhFp
         jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
         PmmdzqPrVvPwwTWBwg
         wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
         ttgJtRGJQctTZtZT
         CrZsJsPPZsGzwwsLwLmpwMDw
         """

         // "vJrwpWtwJgWrhcsFMMfFFhFp"
         //  -> ["vJrwpWtwJgWr", "hcsFMMfFFhFp"]
         //  -> "p" in common
         //  -> p = 16

         */

        let lines = inputString.components(separatedBy: "\n")
//        print(lines.count)

        let sumOfPriorities = lines
            .map({ line -> Int in
                let len = line.count / 2
                let p1 = line.prefix(len)
                let p2 = line.suffix(len)

                return Set(p1)
                    .intersection(p2)
                    .map(\.priority)
                    .reduce(0, +)
    //            return Set(p1)
    //                .intersection(p2)
    //                .first!
    //                .priority
            })
            .reduce(0, +)

        return sumOfPriorities.description
    }

    func part2() -> String {
        /*

         vJrwpWtwJgWrhcsFMMfFFhFp
         jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
         PmmdzqPrVvPwwTWBwg
         wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
         ttgJtRGJQctTZtZT
         CrZsJsPPZsGzwwsLwLmpwMDw

         ->
            ["vJrwpWtwJgWrhcsFMMfFFhFp", "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL", "PmmdzqPrVvPwwTWBwg", "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn", "ttgJtRGJQctTZtZT", "CrZsJsPPZsGzwwsLwLmpwMDw"]
         ->
            [["vJrwpWtwJgWrhcsFMMfFFhFp", "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL", "PmmdzqPrVvPwwTWBwg"], ["wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn", "ttgJtRGJQctTZtZT", "CrZsJsPPZsGzwwsLwLmpwMDw"]]
                1. prevCommonCharSet = "vJrwpWtwJgWrhcsFMMfFFhFp" in array of characters
                2. for each ch in next string "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL", if ch exists in prevCommonCharSet, store it to nextCommonCharSet
                3. prevCommonCharSet = nextCommonCharSet
                4. Go to 2 if there is next string
         ->
            ["r", "Z"]
         ->
            [18, 52]
         ->
            70

         */

        let lines = inputString.components(separatedBy: "\n")
        print(lines.count)

        let res = lines // ["vJrwpWtwJgWrhcsFMMfFFhFp", "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL", "PmmdzqPrVvPwwTWBwg", "wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn", "ttgJtRGJQctTZtZT", "CrZsJsPPZsGzwwsLwLmpwMDw"]
            .reduce(into: (groups: [[String]](), cache: [String]())) { res, str in
                res.cache.append(str)
                if res.cache.count == 3 {
                    res.groups.append(res.cache)
                    res.cache.removeAll()
                }
            }.groups // [["vJrwpWtwJgWrhcsFMMfFFhFp", "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL", "PmmdzqPrVvPwwTWBwg"], ["wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn", "ttgJtRGJQctTZtZT", "CrZsJsPPZsGzwwsLwLmpwMDw"]]
            .map({ group in
                return Set(group[0])
                    .intersection(Set(group[1]))
                    .intersection(Set(group[2]))
                    .first!
                    .priority
    //                .map(\.priority)
    //                .reduce(0, +)
            }) // ["r", "Z"] -> [18, 52]
            .reduce(0, +) // 70
            .description

        return res
    }
}

private extension Character {
    var priority: Int {
        return isUppercase ?
            Int(asciiValue! - "A".first!.asciiValue! + 27) :
            Int(asciiValue! - "a".first!.asciiValue! + 1)
    }
}
