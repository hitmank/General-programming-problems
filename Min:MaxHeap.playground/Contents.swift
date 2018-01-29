struct MaxHeap{
    var currentSize : Int = 0
    var elementList : [Int] = [Int]()
    
    mutating func buildHeap(withArray inputArray: [Int]){
        self.currentSize = inputArray.count - 1
        elementList = inputArray
        var currentIndex = self.currentSize/2 - 1
        while currentIndex >= 0 {
            if((elementList[currentIndex] > elementList[getLeftChildIndex(forNode: currentIndex)]) || ((elementList[currentIndex] > elementList[getRightChildIndex(forNode: currentIndex)])) ){
                
                let smallerIndex = elementList[getLeftChildIndex(forNode: currentIndex)] < elementList[getRightChildIndex(forNode: currentIndex)] ? getLeftChildIndex(forNode: currentIndex) : getRightChildIndex(forNode: currentIndex)
                
                swap(elementsAtIndex: currentIndex, index2: smallerIndex)
                
            }
            currentIndex = currentIndex - 1
        }
    }
    
    func getLeftChildIndex(forNode parentIndex: Int)->Int{
        return parentIndex*2 + 1
    }
    func getRightChildIndex(forNode parentIndex: Int)->Int{
        return parentIndex*2 + 2
    }
    
    mutating func swap(elementsAtIndex index1:Int, index2: Int){
        let tmp = elementList[index1]
        elementList[index1] = elementList[index2]
        elementList[index2] = tmp

    }
    
}

var h = [6,2,10,12,7,13,9];
var heap = MaxHeap()
heap.buildHeap(withArray: h)
print(heap.elementList)

