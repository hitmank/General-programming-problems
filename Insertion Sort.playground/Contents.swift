
func insertionSort(arr : inout [Int]){
    
    for iter in 1...arr.count-1{
        let key = arr[iter];
        var j = iter - 1;
        while j >= 0 && arr[j] > key {
            arr[j+1] = arr[j]
            j -= 1
        }
        arr[j+1] = key
    }
    
}

var input = [0,-1,14,2,1,19,12]
print("Before Sort :")
print(input)
insertionSort(arr: &input)
print("After sort :")
print(input)
