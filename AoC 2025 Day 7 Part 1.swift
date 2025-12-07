import Foundation
let inputFilePath = "/Users/tejaspatel/Desktop/Programming Projects/AoC 2025 Day 7/AoC 2025 Day 7/input.txt"
guard let fileContent = readInputFile(at: inputFilePath) else { fatalError("Failed to read input file at path: \(inputFilePath)") }
func readInputFile(at path: String) -> String? {
    do {
        let content = try String(contentsOfFile: path)
        return content
    } catch {
        return nil
    }
}
var cols = 141, rows = 141, count = 0
var statuses: [Bool] = Array(repeating: false, count: rows)
var array: [[Substring]] = Array(repeating: Array(repeating: "", count: cols), count: rows)
var rowsData = fileContent.split(separator: "\n")
for (i, rowData) in rowsData.enumerated() {
    let chars: [Substring] = rowData.map { String($0)[...] }
    for (j, ch) in chars.enumerated() {
        if i < rows && j < cols {
            array[i][j] = ch
        }
    }
}
statuses[70] = true
for i in 1..<cols {
    for j in 0..<rows {
        if statuses[j] == true && array[i][j] == "^"{
            statuses[j] = false; statuses[j-1] = true; statuses[j+1] = true; count += 1; print(i,j)
        }
    }
}
print(count)
