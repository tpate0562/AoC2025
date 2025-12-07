import Foundation
let inputFilePath = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2025 Day 6/AoC 2025 Day 6/input.txt"
func readInputFile(at path: String) -> String? {
    do {
        let content = try String(contentsOfFile: path)
        return content
    } catch {
        return nil
    }
}
var fileContent = readInputFile(at: inputFilePath)
var cols = 1000, rows = 4, count = 0
var array: [[Int]] = Array(repeating: Array(repeating: 0, count: cols), count: rows)
var operations: [Substring] = []
operations = "\*Dewhitespaced line 5 of the input goes here*/".split(separator: "")
var rowsData = fileContent!.split(separator: "\n")
for (i, rowData) in rowsData.enumerated() {
    let values = rowData.split(separator: " ").compactMap { Int($0) }
    for (j, value) in values.enumerated() {
        if i < rows && j < cols {
            array[i][j] = value
        }
    }
}
for i in 0...999{
    if operations[i] == "+"{
        count += array[0][i] + array[1][i] + array[2][i] + array[3][i]
    }
    if operations[i] == "*"{
        count += array[0][i] * array[1][i] * array[2][i] * array[3][i]
    }
}
print(count)
