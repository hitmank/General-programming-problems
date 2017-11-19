func quicksort( array : inout [Int], low : Int, high: Int){
    if high <= low{
        return
    }
        let partitionPosition = partitionArray( input : &array, low : low, high : high, pivot : array[high])
        quicksort(array : &array, low : low, high: partitionPosition - 1)
        quicksort(array : &array, low : partitionPosition + 1, high: high)
    
    
}

private func partitionArray( input : inout [Int], low : Int, high: Int, pivot : Int)->Int{
    
    var leftPtr = low
    var rightPtr = high

    while(true){
        
        while arr[leftPtr] < pivot {
            if leftPtr == high{
                break
            }
            leftPtr += 1
            
        }
        
        while arr[rightPtr] >= pivot {
            if rightPtr == low{
                break
            }
            rightPtr -= 1
            
        }
        
        if leftPtr >= rightPtr{
            break;
        }
        
        swap(arr: &arr, pos1: leftPtr, pos2: rightPtr)
    }
    swap(arr: &input, pos1: leftPtr, pos2 : high)

    return leftPtr
}

private func swap(arr: inout [Int], pos1: Int, pos2 : Int){
    let tmp = arr[pos1]
    arr[pos1] = arr[pos2]
    arr[pos2] = tmp
}

func SelectionSort(arr : inout [Int]){
    var ptr = 0
    while ptr < arr.count-1{
        var min = ptr
        for i in ptr+1...arr.count-1{
            
            if arr[i] < arr[min]{
                
                min = i
                
            }
            
        }
        
        let tmp = arr[ptr]
        arr[ptr] = arr[min]
        arr[min] = tmp
        
        ptr += 1
        
    }
}
func mergeSort(arr : inout [Int], low : Int, high : Int){
    
    if high <= low{
        return
    }
    
    let middle = (low + high)/2
    print(middle)
    mergeSort(arr: &arr, low : low, high: middle)
    mergeSort(arr: &arr, low : middle+1, high: high)
    merge(arr: &arr, low: low, high: high, middle: middle)
}

func merge(arr: inout [Int], low: Int, high: Int, middle : Int){
    
    let arr1 = Array(arr[low...middle])
    let arr2 = Array(arr[middle+1...high])
    
    var leftPtr = 0
    var rightPtr = 0
    
    var iterator = low
    
    while(leftPtr <= arr1.count-1 && rightPtr <= arr2.count-1){
        
        if arr1[leftPtr] <= arr2[rightPtr]{
            arr[iterator] = arr1[leftPtr]
            leftPtr += 1
        }
        else{
            arr[iterator] = arr2[rightPtr]
            rightPtr += 1
        }
        
        iterator += 1
        
    }
    while leftPtr < arr1.count{
        
        arr[iterator] = arr1[leftPtr]
        iterator += 1
        leftPtr += 1
        
    }
    while rightPtr < arr2.count{
        
        arr[iterator] = arr2[rightPtr]
        iterator += 1
        rightPtr += 1
        
    }
}

func insertionSort(array: inout [Int]){
    for i in 1...array.count-1{
       var j = i-1
       let key = arr[i]
        while j >= 0 && array[j] > key {
           
                array[j+1] = array[j]
                j -= 1
            
        }
        array[j+1] = key
    }
}


var arr = [14,4,5,1,76,2,12,1,1]
print("Original array : ", arr)
//quicksort(array : &arr, low : 0, high : arr.count - 1)
//SelectionSort(arr: &arr)
//mergeSort(arr: &arr, low: 0, high: arr.count-1)
insertionSort(array: &arr)
print("Sorted array : ", arr)
