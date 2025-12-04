//
//  main.swift
//  AoC 2025 Day 4
//
//  Created by Tejas Patel on 12/3/25.
//

import Foundation
let inputFilePath = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2025 Day 4/AoC 2025 Day 4/input.txt"
func readInputFile(at path: String) -> String? {
    do {
        let content = try String(contentsOfFile: path)
        return content} catch {return nil
}}
var fileContent = readInputFile(at: inputFilePath)
var cols = 139, rows = 139, count = 0
let rowsData = fileContent!.split(separator: "\n")
var array: [[Character]] = []
    for row in rowsData {
        array.append(Array(row))
    }
var zrray: [[Character]] = Array(repeating: Array(repeating: ".", count: 141), count: 141)
for i in 0...138{
    for j in 0...138{
        zrray[i+1][j+1] = array[i][j]
    }
}
var numSurrounding: Int = 0
for _ in 0...33{
    for k in 1...140{
        for l in 1...140{
            if zrray[k][l] == "@"{
                if zrray[k-1][l] == "@"{numSurrounding += 1}
                if zrray[k+1][l] == "@"{numSurrounding += 1}
                if zrray[k][l-1] == "@"{numSurrounding += 1}
                if zrray[k][l+1] == "@"{numSurrounding += 1}
                if zrray[k+1][l+1] == "@"{numSurrounding += 1}
                if zrray[k-1][l+1] == "@"{numSurrounding += 1}
                if zrray[k+1][l-1] == "@"{numSurrounding += 1}
                if zrray[k-1][l-1] == "@"{numSurrounding += 1}
                if numSurrounding < 4{count += 1; zrray[k][l] = "."}
                numSurrounding = 0       
            }
        }
    }
}
print(count)
