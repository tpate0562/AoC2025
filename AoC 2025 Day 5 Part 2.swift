//
//  main.swift
//  AoC 2025 Day 5
//
//  Created by Tejas Patel on 12/4/25.
//

import Foundation
let inputFilePath = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2025 Day 5/AoC 2025 Day 5/input.txt"
func readInputFile(at path: String) -> String? {
    do {
        let content = try String(contentsOfFile: path)
        return content} catch {return nil
}}
var fileContent = readInputFile(at: inputFilePath)
var cols = 2, rows = 171, count = 0
var array: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)

var rowsData = fileContent!.split(separator: "\n")
for (i, rowData) in rowsData.enumerated() {
    let values = rowData.split(separator: "-").compactMap { Int($0) }
    for (j, value) in values.enumerated() {
        if i < rows && j < cols {array[i][j] = value}
}}
for n in 0...array.count-1{
    if n > array.count-1 {break}
    for o in 0...array.count-1{
        if o > array.count-1 {break}
        if array[n][0] < array[o][0] && array[n][1] > array[o][1]{
            array.remove(at: o)
        }
    }
}
for l in 0...array.count-1{
    if l > array.count-1 {break}
    for m in 0...array.count-1{
        if m > array.count-1 {break}
        if array[l][0] == array[m][0] && l != m{
            if array[l][1] < array[m][1]{
                array.remove(at: l)
            }
            else {
                array.remove(at: m)
            }
        }
        if array[l][1] == array[m][1] && l != m{
            print(m, array[l], array[m])
            if array[l][0] > array[m][0]{
                array.remove(at: l)
            }
            else {
                array.remove(at: m)
            }
        }
    }
}
for _ in 0...170{
    for i in 0...array.count-1 {
        if i > array.count-1 {break}
        loop1: for j in 0...array.count-1{
            if j > array.count-1 {break loop1}
            if array[i][1] >= array[j][0] && array[i][0] < array[j][0] && i != j && array[i][1] < array[j][1]{
                print(array[i], array[j])
                array[i][1] = array[j][1]
                array.remove(at: j)
                continue loop1
            }
        }
    }
}
var countUpper: Int = 0, countLower: Int = 0
for k in 0..<array.count{
    countUpper += (array[k][1]+1)
    countLower += array[k][0]
}
print(countUpper-countLower)
