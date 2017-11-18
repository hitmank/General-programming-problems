class Node{
    
    var value : Int
    var leftChild : Node? = nil
    var rightChild : Node? = nil
    init( val : Int){
        self.value = val
    }
    
}


struct Tree{
    var root : Node?
    init(withRoot node: Node){
        self.root = node
    }
}


func AreTheySubtrees(tree1 : Tree, tree2 : Tree)->Bool{
    
    if tree2.root == nil{
        return true
    }
    return findSubtree(r1: tree1.root,r2: tree2.root)
}

func findSubtree(r1 : Node?, r2 : Node?)->Bool{
    
    if r1 == nil{
        return false
    }
    
    if r1!.value == r2!.value{
        if (startCompare(node1: r1, node2: r2)){
            return true
        }
    }
    
    return findSubtree(r1: r1!.leftChild, r2: r2!) || findSubtree(r1: r1!.rightChild, r2: r2!)
}

func startCompare(node1: Node?, node2: Node?)->Bool{
    
    if node1 == nil && node2 == nil{
        return true
    }
    if node1 == nil || node2 == nil{
        return false
    }
    if node1!.value != node2!.value{
        return false
    }
    return startCompare(node1 : node1!.leftChild, node2 : node2!.leftChild) && startCompare(node1 : node1!.rightChild, node2 : node2!.rightChild)
    
}


let root  = Node(val :10)
let node1  = Node(val :12)
let node2  = Node(val :15)
let node3  = Node(val :25)
let node4  = Node(val :30)
let node5  = Node(val :36)
let node6  = Node(val :3)
let node7  = Node(val :19)
let node8  = Node(val :12)
let node9  = Node(val :6)
let node10  = Node(val :8)

root.leftChild = node1
root.rightChild = node2
node1.leftChild = node3
node1.rightChild = node4
node2.leftChild = node5
node2.rightChild = node6
node3.leftChild = node7
node4.leftChild = node8
node5.leftChild = node9
node6.rightChild = node10


let node1A  = Node(val :12)
let node2A  = Node(val :30)
let node3A  = Node(val :12)
let node4A  = Node(val :25)
let node5A  = Node(val :19)

node1A.rightChild = node2A
node1A.leftChild = node4A
node4A.leftChild = node5A
node2A.leftChild = node3A

let nodeA  = Node(val :15)
let nodeB  = Node(val :36)
let nodeC  = Node(val :3)
let nodeD  = Node(val :6)
let nodeE  = Node(val :98)
nodeA.leftChild = nodeB
nodeA.rightChild = nodeC
nodeB.leftChild = nodeD
nodeC.rightChild = nodeE

let tree1 = Tree(withRoot: root)
let tree2 = Tree(withRoot: node1A)
let tree3 = Tree(withRoot: nodeA)

print("Is tree2 a subtree of tree1? ->",AreTheySubtrees(tree1: tree1, tree2:tree2))
print("Is tree3 a subtree of tree1? ->",AreTheySubtrees(tree1: tree1, tree2:tree3))





