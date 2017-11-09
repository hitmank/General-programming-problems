class Node{
    var value : Int
    var nextPtr : Node?
    init(val : Int) {
        self.value = val
    }
}

class LinkedList{
    var head : Node
    init(withHead val: Int) {
        let newNode = Node.init(val: val)
        self.head = newNode
    }
    func addNode(withValue value: Int){
        let newNode = Node.init(val: value)
        var currNode : Node = head
        while currNode.nextPtr != nil {
            currNode = currNode.nextPtr!
        }
        currNode.nextPtr = newNode
    }
    func removeNode(withValue val:Int) {
        if head.value == val {
            head = head.nextPtr!
            return
        }
        var currNode : Node = head
        while currNode.nextPtr != nil {
            if let next = currNode.nextPtr{
                if next.value == val{
                    currNode.nextPtr = next.nextPtr
                }
            }
            
        }
        
    }
    func printLinkedList(){
        var currNode : Node? = head;
        while currNode != nil {
            print(currNode!.value)
            currNode = currNode!.nextPtr
        }
    }
    func getNode(withValue val: Int)->Node?{
        var currNode : Node? = head;
        while currNode != nil {
            if currNode!.value == val{
                return currNode!
            }
            currNode = currNode!.nextPtr
        }
        return nil
    }
    
    func detectCycle()->Bool{
        
        var slowPtr : Node? = head
        var fastPtr : Node? = head.nextPtr
        
        while slowPtr != nil && fastPtr != nil {
            
            if slowPtr! === fastPtr! {
                return true
            }
            
            slowPtr = slowPtr?.nextPtr
            fastPtr = fastPtr?.nextPtr?.nextPtr
            
        }
        
        
        return false
    }
    
    
}

var ll = LinkedList.init(withHead: 5)
ll.addNode(withValue: 10)
ll.addNode(withValue: 103)
ll.addNode(withValue: 30)
ll.addNode(withValue: 2)
ll.addNode(withValue: 1)
ll.addNode(withValue: 9)

if let node = ll.getNode(withValue: 9){
    if let node2 = ll.getNode(withValue: 30){
        node.nextPtr = node2
    }
}

print(ll.detectCycle())
