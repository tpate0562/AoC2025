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
    // Split the range on '-' and convert Substrings to trimmed Strings
    let parts = row.split(separator: "-").map { String($0).trimmingCharacters(in: .whitespacesAndNewlines) }
    for i in Int(parts[0])!...Int(parts[1])! {
        if i % 100001 == 0 {if String(i).count == 10 {count += i;print(i);continue}}
        if i % 10001 == 0 {if String(i).count == 8 {count += i;print(i);continue}}
        if i % 1001 == 0 {if String(i).count == 6 {count += i;print(i);continue}}
        if i % 101 == 0 {if String(i).count == 4 {count += i;print(i);continue}}
        if i % 11 == 0 {if String(i).count == 2 {count += i;print(i);continue}}
    }
}
print(count)
 
