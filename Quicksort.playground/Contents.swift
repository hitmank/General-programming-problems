//: Playground - noun: a place where people can play

import UIKit

func quickSort(arr : inout [Int], left: Int, right:Int){
    if right <= left{
        return
    }
    let pivotLocation = partition(arr: &arr, pivot: arr[right],left: left,right: right)
    quickSort(arr: &arr, left: left, right: pivotLocation-1)
    quickSort(arr: &arr, left: pivotLocation+1, right: right)
    
}
func partition(arr: inout [Int], pivot: Int, left : Int, right: Int)->Int{
    
    var leftPtr = left;
    var rightPtr = right;

    while true{
        
        while arr[leftPtr] <= pivot {
            if leftPtr == right{
                break
            }
            leftPtr += 1
            
        }
        
        while arr[rightPtr] > pivot {
            if rightPtr == left{
                break
            }
            rightPtr -= 1
            
        }
        
        if leftPtr >= rightPtr{
            break;
        }
        
        swapElements(arr: &arr, pos1: leftPtr, pos2: rightPtr)
        
    }
    swapElements(arr: &arr, pos1: leftPtr, pos2: right)
    return leftPtr
}

func swapElements( arr: inout [Int], pos1: Int, pos2: Int){
    let tmp = arr[pos1]
    arr[pos1] = arr[pos2]
    arr[pos2] = tmp
}

var input = [-1,0,23,1,94,0,2]
print("Unsorted:")
print(input)
quickSort(arr: &input, left: 0, right: input.count-1)
print("Sorted:")
print(input)


