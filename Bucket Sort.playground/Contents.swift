func bucketSort_float(array: inout [Float]){
    
    var buckets = [[Float]](repeating: [Float](), count:array.count)
    
    for n in array{
        let index : Int = Int(n * Float(array.count))
        buckets[index].append(n)
        
    }
    print(buckets)
    for var bucket in buckets{
        
        if bucket.count > 0{
            bucket = bucket.sorted()
        }
        
    }
    var a = [Float]()
    for bucket in buckets{
        
        for element in bucket{
            a.append(element)
        }
        
    }
    array = a
    
}

func bucketSort_Any(array: inout [Int]){
    var buckets = [[Int]](repeating: [Int](), count:array.count)
    
    for n in array{
        let index : Int = numberOfBitsIn(number: n)
        buckets[index].append(n)
        
    }
    print(buckets)
    for var bucket in buckets{
        
        if bucket.count > 0{
            bucket = bucket.sorted()
        }
        
    }
    var a = [Int]()
    for bucket in buckets{
        
        for element in bucket{
            a.append(element)
        }
        
    }
    array = a
}

private func numberOfBitsIn(number : Int)->Int{
    
    var count = 0
    var n = number
    while n > 0{
        count += 1
        n >>= 1
    }
    return count
    
}

var arr : [Float] = [0.4,0.123,0.88,0.5,0.12,0.45,0.23,0.78]
var arr2 = [4,2,11,3,4,1]
print("Original array: ", arr)
bucketSort_Any(array: &arr2)
print("Sorted Array : ",arr2)

