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
var highestNum = 0; var currentNum = 0
for row in array {
    var theRow = row
    for l in 0...11{
        var highestValueLocation = theRow[l...theRow.count - 12 + l].firstIndex(of: theRow[l...theRow.count - 12 + l].max()!)!
        if highestValueLocation > l {if highestValueLocation > l {theRow.removeSubrange(l...highestValueLocation-1)}}
    }
    var string1: String = String(theRow[0])+String(theRow[1])+String(theRow[2])+String(theRow[3])+String(theRow[4])
    var string2: String = String(theRow[5])+String(theRow[6])+String(theRow[7])+String(theRow[8])+String(theRow[9])+String(theRow[10])+String(theRow[11])
    highestNum = Int(string1 + string2)!
    count += highestNum
    print(highestNum)
    
}
print(count)
