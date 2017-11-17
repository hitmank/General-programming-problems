class Node : Comparable{
    static func <(lhs: Node, rhs: Node) -> Bool {
        if lhs.value < rhs.value{
            return true
        }
        return false
    }
    
    static func ==(lhs: Node, rhs: Node) -> Bool {
        if lhs.value == rhs.value && lhs.nextPtr == rhs.nextPtr{
            return true
        }
        return false
    }
    
    var value : Int
    var nextPtr : Node?
    init(withValue val:Int){
        self.value = val
    }
    
}

class LinkedList{
    var head : Node?
    init(withHead node: Node){
        self.head = node
    }
    func removeDuplicates(){
        
        if head == nil{
            return
        }
        if head!.nextPtr == nil{
            return
        }
        var currNode = head!.nextPtr
        var ptr = head
        while currNode != nil{
//            print("Current Node = " , currNode!.value)
//            print("Ptr Node = " , ptr!.value)
            var iteratorNode = head
            while iteratorNode != ptr!.nextPtr{
//                print("Iterator Node = " , iteratorNode!.value)

                if iteratorNode!.value == currNode!.value{
                   
                    break
                }
                iteratorNode = iteratorNode!.nextPtr
            }
            if iteratorNode == ptr!.nextPtr{
//                print("is equal")
                ptr!.nextPtr = currNode!
                ptr = currNode!
            }
            
            currNode = currNode!.nextPtr
        }
        
        ptr!.nextPtr = nil
        
    }
    func printMe(){
        
        if head == nil{
            return
        }
        var currNode = head
        var str = ""
        while currNode != nil{
            
            str.append(" ->")
            str.append(String(currNode!.value))
            currNode = currNode!.nextPtr
            
        }
        print(str)
    }
}


let node1 = Node(withValue : 3)
let node2 = Node(withValue : 3)
let node3 = Node(withValue : 8)
let node4 = Node(withValue : 2)
let node5 = Node(withValue : 3)
let node6 = Node(withValue : 13)
let node7 = Node(withValue : 6)
let node8 = Node(withValue : 6)
node1.nextPtr = node2
node2.nextPtr = node3
node3.nextPtr = node4
node4.nextPtr = node5
node5.nextPtr = node6
node6.nextPtr = node7
node7.nextPtr = node8

let theLL = LinkedList(withHead : node1)
print("Original Linked List :\n")
theLL.printMe()
print("\nAfter removing duplicates :")
theLL.removeDuplicates()
theLL.printMe()

