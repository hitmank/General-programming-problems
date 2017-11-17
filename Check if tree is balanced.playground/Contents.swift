// check if binary tree is balanced.
// maxDepth - minDepth <= 1

class Node{
    var value : Int
    var leftChild : Node? = nil
    var rightChild : Node? = nil
    init(withValue val : Int){
        self.value = val
    }
}

struct Tree{
    var root : Node? = nil

    func isBalanced()->Bool{
        
        if root == nil{
            return false
        }
        
        if maxDepth(from: root!) - minDepth(from : root!) <= 1{
            return true
        }
        else{
            return false
        }
        
    }
    
    private func maxDepth(from root:Node?)->Int{
        
        if root == nil{
            return 0
        }
        
        return 1 + max(maxDepth(from : root!.leftChild),maxDepth(from: root!.rightChild))
        
    }
    
    private func minDepth(from root:Node?)->Int{
        if root == nil{
            return 0
        }
        
        return 1 + min(minDepth(from : root!.leftChild),minDepth(from: root!.rightChild))
    }
}


var node1 : Node = Node( withValue : 5)
var node2 : Node = Node( withValue : 4)
var node3 : Node = Node( withValue : 9)
var node4 : Node = Node( withValue : 1)
var node5 : Node = Node( withValue : 6)
var node6 : Node = Node( withValue : 8)
var node7 : Node = Node( withValue : 19)
var node8 : Node = Node( withValue : 18)
node1.leftChild = node2
node1.rightChild = node3
node2.leftChild = node4
node2.rightChild = node5
node3.leftChild = node6
node3.rightChild = node7
node7.leftChild = node8

var node9 : Node = Node( withValue : 5)
var node10 : Node = Node( withValue : 5)



var myTree = Tree()
myTree.root = node1

var node1A : Node = Node( withValue : 5)
var node2A : Node = Node( withValue : 4)
var node3A : Node = Node( withValue : 9)
var node4A : Node = Node( withValue : 1)
var node5A : Node = Node( withValue : 6)
var node6A : Node = Node( withValue : 8)
var node7A : Node = Node( withValue : 19)
var node8A : Node = Node( withValue : 18)
var node9A : Node = Node( withValue : 15)
var node10A : Node = Node( withValue : 35)

node1A.leftChild = node2A
node1A.rightChild = node3A
node2A.leftChild = node4A
node2A.rightChild = node5A
node3A.leftChild = node6A
node3A.rightChild = node7A
node7A.leftChild = node8A
node5A.leftChild = node9A
node9A.leftChild = node10A

var myTree_unbalanced = Tree()
myTree_unbalanced.root = node1A


print("Tree 1 - balanced - ", myTree.isBalanced())
print("Tree 2 - balanced - ", myTree_unbalanced.isBalanced())





