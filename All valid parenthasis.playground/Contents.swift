func printAllValid(lCount: Int, rCount : Int, str : inout [Character], count: Int){
    
    if lCount < 0 || rCount < lCount{
        return
    }
    if lCount == 0 && rCount == 0{
        print(String(str))
        return
    }
    else{
        
        if(lCount > 0){
            
            str[count] = "("
            printAllValid(lCount: lCount-1, rCount : rCount, str : &str, count: count+1)
            
            
        }
        if(rCount > 0){
            
            str[count] = ")"
            printAllValid(lCount: lCount, rCount : rCount-1, str : &str, count: count+1)
            
            
            
        }
        
        
    }
    
    
    return
    
    
    
}

let n = 3
var count = 0
var empty = [Character](repeating: " ", count: n*2)
printAllValid( lCount : n, rCount :n, str : &empty, count: count)
