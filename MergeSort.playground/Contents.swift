import Foundation

func mergeSort(arr : inout [Int], left : Int, right : Int){
    
    if right <= left{
        return;
    }
    let midPoint = (right + left) / 2
    mergeSort(arr: &arr, left: left, right: midPoint)
    mergeSort(arr: &arr, left:midPoint+1, right: right)
    merge(arr: &arr, left: left, mid: midPoint, right: right)
}

func merge(arr: inout [Int], left: Int, mid: Int, right: Int){
    var iterator = left;
    var leftPtr = 0;
    var rightPtr = 0;
    let arr1 = Array(arr[left...mid])
    let arr2 = Array(arr[mid+1...right])

    
    while leftPtr <= arr1.count-1 && rightPtr <= arr2.count-1{
        if arr1[leftPtr] <= arr2[rightPtr]{
            arr[iterator] = arr1[leftPtr];
            leftPtr += 1;
        }
        else{
            arr[iterator] = arr2[rightPtr];
            rightPtr += 1;
        }
        iterator += 1

    }

    
    while leftPtr <= arr1.count-1{
        arr[iterator] = arr1[leftPtr];
        leftPtr += 1
        iterator += 1
    }
    
    while rightPtr <= arr2.count-1{
        arr[iterator] = arr2[rightPtr];
        rightPtr += 1
        iterator += 1
    }

}

var input = [-1,0,23,1,94,0,2];
print("Before sorting :");
print(input);
mergeSort(arr: &input, left: 0, right: input.count-1)
print("After sorting :");
print(input)





