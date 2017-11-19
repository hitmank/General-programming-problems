import Foundation
func CountSort(str : inout String){
    
    var input = str
    var arr = Array(str.characters)
    var counter = [Int](repeating: 0, count : 256)
    
    for character in input.utf8 {
        counter[Int(character)] += 1
    }
    
    for i in 1...255{
        counter[i] = counter[i] + counter[i-1]
    }
    
    for (index,character) in input.utf8.enumerated() {
        let pos = counter[Int(character)] - 1
        counter[Int(character)] -= 1
        arr[pos] = Array(str.characters)[index]
    }
    
    str = String(arr)
    
    
    
    
    
}
var o = "dfsdfgkdfakjasbnjdjaknsmnbzb"
print("Original  :", o)
CountSort(str: &o)
print("After Sort :", o)
