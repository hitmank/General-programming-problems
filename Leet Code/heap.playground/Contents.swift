struct heap{
    var array : [Int] = [Int]()
    mutating func insertElement(_ element:Int){
        self.array.append(element)
        var pos = self.array.count-1
        bubbleUp(&pos)
    }
    mutating func bubbleUp(_ pos:inout Int){
        if pos == 0 {
            return
        }
        let valueAtPos = self.array[pos]
        let valueAtParent = self.array[(pos-1)/2]
        if valueAtPos > valueAtParent {
            swap(pos1: pos, pos2: (pos-1)/2)
            pos = (pos-1)/2
            bubbleUp(&pos)
        }
        else{
            return
        }
    }
    mutating func deleteMax()->Int{
        let max = self.array[0]
        swap(pos1: 0, pos2: self.array.count-1)
        self.array.removeLast()
        var pos = 0
        bubbleDown(&pos)
        return max
    }
    mutating func buildHeap(_ inputArray:[Int]){
        self.array = inputArray
        for var x in (0...self.array.count/2-1).reversed(){
            bubbleDown(&x)
        }
    }
    mutating func bubbleDown(_ pos: inout Int){
        if(isLeaf(pos)){
            return
        }
        let leftChildValue = hasLeftChild(pos) ? self.array[(pos*2) + 1] : -1
        let rightChildValue = hasRightChild(pos) ? self.array[(pos*2) + 2] : -1
        
        if(self.array[pos] < leftChildValue || self.array[pos] < rightChildValue){
            if leftChildValue > rightChildValue {
                swap(pos1: pos, pos2: (pos*2)+1)
                pos = (pos*2) + 1
            }
            else{
                swap(pos1: pos, pos2: (pos*2)+2)
                pos = (pos*2) + 2
            }
            bubbleDown(&pos)
        }
        else{
            return
        }

    }
    mutating func swap(pos1: Int, pos2: Int){
        let temp = self.array[pos1]
        self.array[pos1] = self.array[pos2]
        self.array[pos2] = temp
        
    }
    func isLeaf(_ pos: Int)->Bool{
        if pos >= self.array.count/2 {
            return true
        }
        return false
    }
    func hasLeftChild(_ pos:Int)-> Bool{
        if (pos*2)+1 > self.array.count-1 {
            return false
        }
        return true
    }
    func hasRightChild(_ pos:Int)-> Bool{
        if (pos*2)+2 > self.array.count-1 {
            return false
        }
        return true
    }
    
}

var h = heap()
h.buildHeap([14,46,3,5,12,91,8,82,2])
print(h.array)
print(h.deleteMax())
print(h.deleteMax())
print(h.deleteMax())
print(h.array)
print(h.insertElement(13))
print(h.array)
