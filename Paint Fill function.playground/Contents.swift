func paintFill( grid: inout [[Int]], row: Int, col: Int, numberToChange: Int, numberToFill: Int){
    
    if row < 0 || row > grid.count-1 || col < 0 || col > grid[0].count-1{
        return
    }
    
    if grid[row][col] == numberToChange{
        
        grid[row][col] = numberToFill
        paintFill(grid: &grid, row: row-1, col: col, numberToChange: numberToChange, numberToFill: numberToFill)
        paintFill(grid: &grid, row: row, col: col-1, numberToChange: numberToChange, numberToFill: numberToFill)
        paintFill(grid: &grid, row: row+1, col: col, numberToChange: numberToChange, numberToFill: numberToFill)
        paintFill(grid: &grid, row: row, col: col+1, numberToChange: numberToChange, numberToFill: numberToFill)
        
    }
    var x = [Character]()
    x.append("s")
    String(x)
    return
    
}


var matrix = [[9, 4, 6, 7], [3, 2, 2, 9], [3, 1, 2, 2],[2, 3, 1, 2]]
print("Before :")
for row in matrix{
    print(row)
}
paintFill(grid: &matrix, row: 2, col: 2, numberToChange: 2, numberToFill: 99)
print("\nAfter :")
for row in matrix{
    print(row)
}
