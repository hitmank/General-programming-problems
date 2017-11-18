func printAllPrimes(upto n: Int){
    
    var arr : [Bool] = [Bool](repeating : true, count : n)
    
    var currIndex = 2
    
    for i in 2...n/2{
        if arr[i]{
            for j in 2...(n-1)/i{
                arr[j*i] = false
            }
        }
    }
    
    for i in 0...n-1 {
        if arr[i]{
            print(i)
        }
    }
}

printAllPrimes(upto: 50)
