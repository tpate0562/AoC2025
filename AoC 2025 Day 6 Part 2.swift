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
var cols = 3755, rows = 4, count = 0, numbers: [Int] = Array(repeating: 0, count: 3755)
var array: [[Substring]] = Array(repeating: Array(repeating: "", count: cols), count: rows)
var operations: [Substring] = []
operations = "+**++++*****+**++++*+*+******++****+*+*++++*+***++*+*+*++***+**+++**++***+++*****+**+++**++++++++******+*+*+++**+*+*+++++++++++++++*****+++*****+++*+*+++*++**+***++++*++**+++*+*++++++*+*+*+++**+*+**++++++++*+**++++++*+**+**+*+*+*+**+*+*++++++*****+++*++*+++*++**++++*+*+*++**+***+*++*++++*++***+*+**++*++*+++***+**+*+++****++********+*++**+****++*++*++++******+*+++*+***+++*+**++***+**++****++++++**+*+++*****++*+++****+++++*++++**+++*****++*++****++**++**+++*+*++++**+*++++*+*+++*++*+***+*+**++++++*+++***+***+++*+*+****+*+****++****+++++++***+***++***+++*+**+**++*+++*+***+*+++****++***++***+**++++*****++*++++**++*+*++**+***+*++***++*****+++**+*++**+*+++*+*+*+*++++++++**+**+++**++++*+*+*++****+*++++*+*+*+**+***+++*++*++*+++++*+++++++++++*+*+***+++++**+****+*++++*++*++++**+++*+++******++*++++++**++**++**+*+**+++**++*+++*****+*++***+++*+***++*++*+*++***++**+++*+*+*+***+*++++*++++++**++**++****++++**+*++**+*+*++*++*++++*+*+++*+****+++*++++*+*+*+****+*+++**+****+***+*+****+****+*+**+++*++****+*".split(separator: "")
var rowsData = fileContent!.split(separator: "\n")
for (i, rowData) in rowsData.enumerated() {
    let chars: [Substring] = rowData.map { String($0)[...] }
    for (j, ch) in chars.enumerated() {
        if i < rows && j < cols {
            array[i][j] = ch
        }
    }
}
for i in 0...3754{
    var theString = String(array[0][i] + array[1][i] + array[2][i] + array[3][i])
    theString = theString.replacingOccurrences(of: " ", with: "")
    numbers[i] = Int(theString) ?? 0
}
var currentCol: Int = 0, i = 0
for _ in 0...999{
    var currentVal = 0
    while numbers[i] != 0{
        if operations[currentCol] == "+"{currentVal += numbers[i]}
        if operations[currentCol] == "*" && currentVal == 0{currentVal = numbers[i]}
        else if operations[currentCol] == "*"{currentVal *= numbers[i]}
        i += 1
    }
    i += 1; currentCol += 1; count += currentVal
}
print(count)
