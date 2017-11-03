

//: Playground - noun: a place where people can play

import UIKit

//Sort array.
//Fix the first element.
//Get compliment of that, and search for pair sum of the remaining elements.
//Time complextity => O(nlogn) + O(n^2) = O(n^2)

func Do3sumWithSorting(nums : [Int], target : Int)->[[Int]]{
    
    let sortedArr = nums.sorted()
    var answer : [[Int]] = [[Int]]()
    for (index,element) in sortedArr.enumerated(){
        
        let compliment = target - element
        //Search remaining part of array for compliment.
        var i = index + 1;
        var j = sortedArr.count - 1;
        while i < j {
            let sum = sortedArr[i] + sortedArr[j]
            if sum == compliment{
                answer.append([element,sortedArr[i],sortedArr[j]])
                i += 1;
                j -= 1;
            }
            else if(sum > compliment){
                j -= 1;
            }
            else{
                i += 1;
            }
        }
        
    }
    return answer
}

let ans = Do3sumWithSorting(nums: [4,2,1,0,-1,3,12,24], target: 13)
print(ans)
//Dont Sort Array.
//Fix first element.
//Get compliment and search of 2 sum using hash table.
//Time complexity = O(n^2)
func Do3sumWithOutSorting(nums : [Int], target : Int)->[[Int]]{
    
    var answer : [[Int]] = [[Int]]()
    
    for (index,number) in nums.enumerated(){
        var dict : [Int:Int] = [Int:Int]()
        if index == nums.count - 1{
            break;
        }
        let compliment = target - number
        //find compliment as 2 sum from remaining array
        for i in index + 1...nums.count-1{
            if let val = dict[nums[i]]{
                answer.append([number,nums[i],val])
            }
            else{
                let subCompliment = compliment - nums[i]
                dict[subCompliment] = nums[i]
            }
        }
    }
    return answer
}

//Find all possible pair sums. (n^2)
//Traverse array again and search for the compatible pair for the target.
//Have to make sure the pair does not include the current element.
let ans1 = Do3sumWithOutSorting(nums: [4,2,1,0,-1,3,12,24], target: 13)
print(ans1)

