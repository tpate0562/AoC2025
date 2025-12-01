//
//  main.swift
//  AoC 2025 Day 1
//
//  Created by Tejas Patel on 11/30/25.
//

import Foundation
let inputFilePath = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2025 Day 1/AoC 2025 Day 1/input.txt"
func readInputFile(at path: String) -> String? {
    do {
        let content = try String(contentsOfFile: path)
        return content} catch {return nil
}}
var fileContent = readInputFile(at: inputFilePath)
var cols = 4, rows = 4531, count = 0
var array: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)

let rowsData = fileContent!.split(separator: "\n")
for (i, rowData) in rowsData.enumerated() {
    if i >= rows { break }
    let chars = Array(rowData)
    for j in 0..<cols {
        if j >= chars.count {array[i][j] = -1}
        else {
            let ch = chars[j]
            if let digit = ch.wholeNumberValue {array[i][j] = digit}
            else if ch == "R" {array[i][j] = 1}
            else if ch == "L" {array[i][j] = -1}
}}}
var stopIndex: Int=0
var occurences: Int = 0
var numberString: String=""
count = 50
//The actual counting logic
for i in 0..<rows {
    for j in 1...3 {
        if array[i][j] == -1 {stopIndex = j}
        else {stopIndex = 4}
    }
    for k in 1..<stopIndex {numberString = numberString + String(array[i][k])}
    numberString = numberString.replacingOccurrences(of: "-1", with: "")
    for l in 0..<Int(numberString)!{
        count += array[i][0]
        if count % 100 == 0 {occurences += 1}
    }
    stopIndex = 0
    numberString = ""
}
print(occurences)
