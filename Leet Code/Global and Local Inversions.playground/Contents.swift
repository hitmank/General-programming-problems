import Foundation
class Solution {
    func isIdealPermutation(_ A: [Int]) -> Bool {
        //check if any of the numbers - its position index is not -1,0 or 1.
        //Because, a number is allowed to be either at its correct index - A[i],
        //or displaced by 1 on either side - A[i-1] or A[i+1]
        for (index, number) in A.enumerated(){
            if(abs(number - index) > 1){
                return false
                
            }
        }
        return true
    }
}
print(pow(5, 2))
Int.ini
