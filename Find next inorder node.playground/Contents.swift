class Node{
    var value : Int
    var leftChild : Node?
    var rightChild : Node?
    var parent : Node?
    init(withValue val : Int){
        self.value = val
    }
}

func createBSTWithMinimalHeight(using arr: [Int])->Node?{
    
    if arr.count == 0{
        return nil
    }
    return createBSTWithMinimalHeight(using: arr, left: 0, right: arr.count-1)
    
}

private func createBSTWithMinimalHeight(using arr: [Int], left : Int, right : Int)->Node?{
    if right < left{
        
        return nil
    }
    let middle : Int = (left + right) / 2
    let newNode = Node(withValue : arr[middle])
    newNode.leftChild = createBSTWithMinimalHeight(using : arr, left : left, right : middle - 1)
    newNode.rightChild = createBSTWithMinimalHeight(using : arr, left : middle+1, right : right)
    return newNode
}

struct BST{
    
    var root: Node?
    init(withRoot  node : Node){
        self.root = node
    }
    func doInorderTraversal(){
        doInorderTraversalfrom( root : root!)
    }
    private func doInorderTraversalfrom( root : Node?){
        
        if root == nil{
            return
        }
        doInorderTraversalfrom( root : root!.leftChild)
        print(root!.value)
        doInorderTraversalfrom( root : root!.rightChild)
        
    }
    func getTreeHeight(from node: Node?)->Int{
        if node == nil{
            return 0
        }
        return 1 + max(getTreeHeight(from: node!.leftChild), getTreeHeight(from: node!.rightChild))
    }
    
    func findNextInorderNode( node: Node?) -> Node?{
        if node == nil{
            return nil
        }
        if node!.rightChild != nil{
            
            var currNode = node!.rightChild!
            
            while currNode.leftChild != nil{
                
                currNode = currNode.leftChild!
            }
            return currNode
        }
        
        let parent = node!.parent
        if parent == nil{
            return nil
        }
        
        if parent!.leftChild?.value == node!.value{
            return parent
        }
        
        return findNextInorderNode(node: parent!.parent)
        
        
    }
    
    
}

var node1 = Node(withValue : 20)
var node2 = Node(withValue : 10)
var node3 = Node(withValue : 40)
var node4 = Node(withValue : 5)
var node5 = Node(withValue : 15)
var node6 = Node(withValue : 25)
var node7 = Node(withValue : 45)

node1.leftChild = node2
node1.rightChild = node3
node2.parent = node1
node3.parent = node1
node2.leftChild = node4
node2.rightChild = node5
node4.parent = node2
node5.parent = node2
node3.leftChild = node6
node3.rightChild = node7
node6.parent = node3
node6.parent = node3

let bst = BST(withRoot: node5)

print(bst.findNextInorderNode(node: node2)?.value)




