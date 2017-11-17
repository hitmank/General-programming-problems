func performTheOperation(on input: inout [[Int]]){
    let numberOfRows = input.count
    let numberOfColumns = input[0].count
    if numberOfColumns == 0{
        return
    }
    var rowInformation : [Bool] = [Bool](repeating: false, count: numberOfRows)
    var columnInformation : [Bool] = [Bool](repeating: false, count: numberOfColumns)
    
    for (rowIndex,row) in input.enumerated(){
        if let colIndexOfZero = row.index(of:0){
            rowInformation[rowIndex] = true
            columnInformation[colIndexOfZero] = true
        }
    }
    for (rowIndex,row) in input.enumerated(){
        for(colIndex,_) in row.enumerated(){
            if rowInformation[rowIndex] == true || columnInformation[colIndex] == true{
                input[rowIndex][colIndex] = 0
            }
        }
    }
    
    
}





var array = [[1,9,5,6],[3,0,1,2],[4,1,0,9]]
print("Input Array :")
for row in array{
    print(row)
}
performTheOperation(on : &array)
print("\nOutput Array :")

for row in array{
    print(row)
}
