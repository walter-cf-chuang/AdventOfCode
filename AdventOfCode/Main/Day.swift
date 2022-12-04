//
//  Day.swift
//  AdventOfCode
//
//  Created by Walter on 2022/12/4.
//

import Foundation

protocol Day {
    init(inputSource: InputSource)
    func part1() -> String
    func part2() -> String
}
