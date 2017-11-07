func SelectionSort(arr: inout [Int]){
    
    let size = arr.count - 1;
    var ptr = 0;
    while ptr < size{
        
        var min = ptr;
        for iter in ptr+1...size{
            if arr[iter] < arr[min]{
                min = iter
            }
        }
        
        let temp = arr[ptr]
        arr[ptr] = arr[min]
        arr[min] = temp
        
        ptr += 1;
        
    }
}

var input = [12, -1, 0,-4, 8, 8, 6, 4, 1, 20]
print("Before sorting :")
print(input)
SelectionSort(arr: &input);
print("After sorting :")
print(input)
