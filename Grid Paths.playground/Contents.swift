let grid = [[1,2,3],[4,5,6],[7,8,9]]
let allowed = [[1,0,1],[0,0,1],[1,1,1]]

func totalNumberOfPaths(row : Int, col : Int)->Int{
    
    if allowed[row][col] == 0 {
        return 0
    }
    
    if row == 0 || col == 0{
        if row == 0 {
            if allowed[0].contains(0){
                return 0
            }
            else{
                return 1
            }
            
        }
        else{
            
        }
        return 1
    }
    
    return totalNumberOfPaths(row : row-1, col : col) + totalNumberOfPaths(row : row, col : col-1)
    
}

print(totalNumberOfPaths(row : 2, col : 2))


