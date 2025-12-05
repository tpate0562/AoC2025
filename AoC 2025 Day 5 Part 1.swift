//
//  main.swift
//  AoC 2025 Day 5
//
//  Created by Tejas Patel on 12/4/25.
//

import Foundation
let inputFilePath = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2025 Day 5/AoC 2025 Day 5/input.txt"
let inputFilePath2 = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2025 Day 5/AoC 2025 Day 5/input2.txt"
func readInputFile(at path: String) -> String? {do {let content = try String(contentsOfFile: path);return content} catch {return nil}}
var fileContent = readInputFile(at: inputFilePath), fileContent2 = readInputFile(at: inputFilePath2), cols = 2, rows = 171, count = 0, array: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows), rowsData = fileContent!.split(separator: "\n"), rowsData2 = fileContent2!.split(separator: "\n")
for (i, rowData) in rowsData.enumerated() {let values = rowData.split(separator: "-").compactMap{Int($0)};for (j, value) in values.enumerated() {if i < rows && j < cols {array[i][j] = value}}}

loop1: for row in rowsData2 {for j in 0...array.count-1{if Int(row)! >= array[j][0] && Int(row)! <= array[j][1] {count += 1;continue loop1}}}
print(count)
