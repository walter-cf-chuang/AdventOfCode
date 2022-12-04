//
//  InputSource.swift
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
