//
//  main.swift
//  AoC 2025 Day 3
//
//  Created by Tejas Patel on 12/2/25.
//

import Foundation
let inputFilePath = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2025 Day 3/AoC 2025 Day 3/input.txt"
func readInputFile(at path: String) -> String? {
    do {
        let content = try String(contentsOfFile: path)
        return content} catch {return nil
}}
var fileContent = readInputFile(at: inputFilePath)
var cols = 100, rows = 200, count = 0
var array: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)

let rowsData = fileContent!.split(separator: "\n")
for (i, rowData) in rowsData.enumerated() {
    let values = rowData.split(separator: "").compactMap { Int($0) }
    for (j, value) in values.enumerated() {
        if i < rows && j < cols {array[i][j] = value}
}}
var highestNum = 0
for row in array {
    for i in 0...98 { for j in i+1...99{
            if Int(String(row[i]) + String(row[j]))! > highestNum {highestNum = Int(String(row[i]) + String(row[j]))!}
}}
    count += highestNum; highestNum = 0
}
print(count)
