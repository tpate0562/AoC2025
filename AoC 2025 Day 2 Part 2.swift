//
//  main.swift
//  AoC 2025 Day 2
//
//  Created by Tejas Patel on 12/1/25.
//

import Foundation
let inputFilePath = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2025 Day 2/AoC 2025 Day 2/input.txt"
func readInputFile(at path: String) -> String? {
    do {
        let content = try String(contentsOfFile: path)
        return content} catch {return nil
}}
var fileContent = readInputFile(at: inputFilePath)
var count = 0
let rowsData = fileContent!.split(separator: ",")
print(rowsData)
for row in rowsData {
    let parts = row.split(separator: "-").map { String($0).trimmingCharacters(in: .whitespacesAndNewlines) }
    for i in Int(parts[0])!...Int(parts[1])! {
        var s = String(i)
        if s.count == 2 {if i % 11 == 0 {count += i;continue}}
        if s.count == 3 {if i % 111 == 0 {count += i;continue}}
        if s.count == 5 {if i % 11111 == 0 {count += i;continue}}
        if s.count == 7 {if i % 1111111 == 0 {count += i;continue}}
        if s.count == 4 {if i % 101 == 0 {count += i;continue}}
        if s.count == 6 {
            if i % 1001 == 0 {count += i;continue}
            if i % 10101 == 0 {count += i;continue}}
        if s.count == 8 {
            if i % 10001 == 0 {count += i;continue}
            if i % 1010101 == 0 {count += i;continue}}
        if s.count == 9 {
            if i % 1001001 == 0 {count += i;continue}}
        if s.count == 10 {
            if i % 100001 == 0 {count += i;continue}
            if i % 101010101 == 0 {count += i;continue}
        }
    }
}
print(count)
