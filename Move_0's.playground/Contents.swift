//: Playground - noun: a place where people can play

import UIKit
//1. Create another array of the same size
//2. Start traversing this array and if the number is Zero, ignore. But if its a non zero, then append to new array
//3. Once you finish traversing. You might be left with some empty slots in the final array. Just fill those with zero. (Or you could just init the array with zero to start with and avoid this step)
//Time complexity : O(n) (one traversal)
//Space complexity = n because extra array.
func move0sToEnd(nums : [Int]) -> ([Int],Int){
    
    let sizeOfArray = nums.count
    var finalArray : Array<Int> = Array(repeating: 0, count: sizeOfArray)
    var finalCount = 0
    for number in nums {
        if number != 0 {
            finalArray[finalCount] = number
            finalCount += 1
        }
    }
    return (finalArray,finalCount)
}

let ans = move0sToEnd(nums: [4,0,0,2,4,0,1])
print("Using extra array - Result Array:", ans.0)
print("Using extra array - Count :", ans.1)

//Perform operation in place.
//1. 2 variables. 1 used to iterate through the array. The other will be used as a placeholder to indicate an availiable position to place a non-zero.
//2. Start with pos = 0 and iter = 0. At each array[i], if the number is non-zero, swap with arr[pos].
//3. Then increment both iter and pos.
//4. If arr[i] is 0, just iterate i and leave pos as is. So, pos now points to a place in the array where a non-zero can potentially be placed.
//I chose swap rather than just place the element so that we dont need to fill out zeros at the end after iteration.
func move0sToEnd_InPlace(nums : inout [Int])->Int{
    var position = 0;
    for (index,number) in nums.enumerated(){
        if number != 0 {
            let temp = nums[position]
            nums[position] = number
            nums[index] = temp
            position += 1;
        }
    }
    return position
}
var input = [4,0,0,2,4,0,1]
let count = move0sToEnd_InPlace(nums: &input)
print("Inplace - Result Array:", input)
print("Inplace - Count :", count)


