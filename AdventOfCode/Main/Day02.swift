//
//  Day02.swift
//  AdventOfCode
//
//  Created by Walter on 2022/12/4.
//

import Foundation

enum InputSource {
    case string(String)
    case file(String)

    var inputString: String {
        switch self {
        case .string(let string):
            return string
        case .file(let filename):
            let fileExtension = "txt"
            let fileURL = Bundle.main.url(forResource: filename, withExtension: fileExtension)
            guard let fileURL = fileURL else {
                assertionFailure("Input file not found for \(filename).\(fileExtension)")
                return ""
            }

            do {
                var content = try String(contentsOf: fileURL, encoding: String.Encoding.utf8)

                if content.last == "\n" {
                    content.removeLast()
                }

                return content
            } catch {
                assertionFailure("Cannot convert data in file to String.")
            }

            return ""
        }
    }
}

protocol Day {
    init(inputSource: InputSource)
    func part1() -> String
    func part2() -> String
}

final class Day02: Day {

    private let inputString: String

    init(inputSource: InputSource) {
        inputString = inputSource.inputString
    }

    func part1() -> String {

        /*
            Rule:
                A = X // Rock
                B = Y // Paper
                C = Z // Scissors

                A > C = Z
                C > B = Y
                B > A = X

                X > C
                X = A
                X < B

                Y > A
                Y = B
                Y < C

                Z > B
                Z = C
                Z < A

            Score:
                By outcome:
                    A = X > C -> 6
                    A = X = A -> 3
                    A = X < B -> 0

                By shape:
                    X = 1
                    Y = 2
                    Z = 3

         */

        /*
            input:
                C Z
                C Y
                A X
                C X

                "C Z\nC Y\nA X\nC X"
         */

        return inputString
            .components(separatedBy: "\n") // ["C Z", "C Y", "A X", "C X"]
            .map({ roundStr -> (scoreByOutcome: Int, scoreByShape: Int) in // "C Z"
                let roundInpus = roundStr.components(separatedBy: " ") // ["C", "Z"]
                let myInput = roundInpus[1]
                let enemyInput = roundInpus[0]

                let scoreByOutcome: Int
                switch (myInput, enemyInput) {
                case ("X", "C"),
                     ("Y", "A"),
                     ("Z", "B"):
                    scoreByOutcome = 6
                case ("X", "A"),
                     ("Y", "B"),
                     ("Z", "C"):
                    scoreByOutcome = 3
                case ("X", "B"),
                     ("Y", "C"),
                     ("Z", "A"):
                    scoreByOutcome = 0
                default:
                    assertionFailure("Invalid input in outcome")
                    scoreByOutcome = 0
                }

                let scoreByShape: Int
                switch myInput {
                case "X":
                    scoreByShape = 1
                case "Y":
                    scoreByShape = 2
                case "Z":
                    scoreByShape = 3
                default:
                    assertionFailure("Invalid input in shape")
                    scoreByShape = 0
                }

                return (scoreByOutcome: scoreByOutcome, scoreByShape: scoreByShape)
            }) // [(score_outcome, score_shape)] = [(3, 3), (0, 2), (3, 1), (6, 1)]
            .map({ $0.scoreByOutcome + $0.scoreByShape })
            .reduce(0, { $0 + $1 })
            .description
    }

    func part2() -> String {

        /*
            Rule:
                A // Rock
                B // Paper
                C // Scissors


                A > C
                A = A
                A < B

                B > A
                B = B
                B < C

                C > B
                C = C
                C < A

            Score:
                By outcome:
                    X -> lose -> 0
                    Y -> draw -> 3
                    Z -> win  -> 6

                By shape:
                    A = 1
                    B = 2
                    C = 3

         */

        /*
            input:
                C Z
                C Y
                A X
                C X

                "C Z\nC Y\nA X\nC X"
         */

        return inputString
            .components(separatedBy: "\n") // ["C Z", "C Y", "A X", "C X"]
            .map({ roundStr -> (scoreByOutcome: Int, scoreByShape: Int) in // "C Z"
                let roundInpus = roundStr.components(separatedBy: " ") // ["C", "Z"]
                let outcomeInput = roundInpus[1]
                let enemyInput = roundInpus[0]

                let scoreByOutcome: Int
                switch outcomeInput {
                case "X":
                    scoreByOutcome = 0
                case "Y":
                    scoreByOutcome = 3
                case "Z":
                    scoreByOutcome = 6
                default:
                    assertionFailure("Invalid input in outcome")
                    scoreByOutcome = 0
                }

                let scoreByShape: Int
                switch (outcomeInput, enemyInput) {
                case ("X", "B"),
                     ("Y", "A"),
                     ("Z", "C"):
                    scoreByShape = 1 // My shape = Rock
                case ("X", "C"),
                     ("Y", "B"),
                     ("Z", "A"):
                    scoreByShape = 2 // My shape = Paper
                case ("X", "A"),
                     ("Y", "C"),
                     ("Z", "B"):
                    scoreByShape = 3 // My shape = Scissors
                default:
                    assertionFailure("Invalid input in shape")
                    scoreByShape = 0
                }

                return (scoreByOutcome: scoreByOutcome, scoreByShape: scoreByShape)
            }) // [(score_outcome, score_shape)] = [(6, 1), (3, 3), (0, 3), (0, 2)]
            .map({ $0.scoreByOutcome + $0.scoreByShape })
            .reduce(0, { $0 + $1 })
            .description
    }
}
