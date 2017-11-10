let input : [Int] = [1, 3, 5, 8, 9, 2, 6, 7, 6, 8, 9]
var jumps : [Int] = [Int](repeating: Int.max, count: input.count)
var path : [Int] = [Int](repeating: -1, count: input.count)

func getMinNumberOfJumps( arr : [Int])->Int{
    
    jumps[0] = 0;
    
    for i in 1...arr.count-1{
        for j in 0...i{
            
            if i <= j + arr[j]{
                
                if jumps[j] + 1 < jumps[i]{
                    jumps[i] = jumps[j] + 1
                    path[i] = j
                }
                
            }
        }
        
    }
    return jumps[arr.count-1]
    
}

let ans = getMinNumberOfJumps(arr: input)
print(ans)
print(jumps)
print(path)
