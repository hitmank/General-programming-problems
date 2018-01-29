struct heap{
    
    var theHeap : [Int] = [Int]()
    func heapify(with Array: inout [Int], index: Int){
     
        var parent = index/2
        var current = index
        while parent >= 0 {
            if Array[parent] < Array[index] {
                swapElements(inArray: &Array, pos1: parent, pos2: current)
            }
            current = parent
            parent = current/2
        }
        
    }
    
    func swapElements(inArray: inout [Int], pos1: Int, pos2: Int){
    
        let temp = inArray[pos1]
        inArray[pos1] = inArray[pos2]
        inArray[pos2] = temp
    
    
    }
    }
    
}
