class Node{
    var name : String
    var leftChild : Node?
    var rightChild: Node?
    init(name:String) {
        self.name = name
    }
}


class BinaryTree{
    var root : Node
    init(withRoot root:Node) {
        self.root = root
    }
    
    func findLeastCommonAncestor(ForNode1 node1: Node, andNode2 node2:Node)->String{
        let result = self.LCAUtil(root: self.root, node1: node1, node2: node2)
        if let _ = result{
            return result!.name
        }
        else{
            return "No least common ancestor"
        }
    }
    
    private func LCAUtil(root: Node?, node1:Node, node2:Node)->Node?{
        
        guard let currNode = root else {
            return nil
        }
        if currNode.name == node1.name || currNode.name == node2.name {
            return currNode
        }
        let leftChild = LCAUtil(root: currNode.leftChild, node1: node1, node2: node2)
        let rightChild = LCAUtil(root: currNode.rightChild, node1: node1, node2: node2)
        
        if leftChild != nil && rightChild != nil {
            return currNode
        }
        else if leftChild == nil && rightChild == nil{
            return nil
        }
        else if leftChild != nil{
            return leftChild
        }
        else{
            return rightChild
        }

    }
}

let nodeA = Node.init(name: "A")
let nodeB = Node.init(name: "B")
let nodeC = Node.init(name: "C")
let nodeD = Node.init(name: "D")
let nodeE = Node.init(name: "E")
let nodeF = Node.init(name: "F")
let nodeG = Node.init(name: "G")
let nodeH = Node.init(name: "H")
let nodeI = Node.init(name: "I")
let nodeJ = Node.init(name: "J")
let nodeK = Node.init(name: "K")
let nodeL = Node.init(name: "L")

nodeA.leftChild = nodeB
nodeA.rightChild = nodeC
nodeB.leftChild = nodeD
nodeB.rightChild = nodeE
nodeD.leftChild = nodeH
nodeE.leftChild = nodeI
nodeE.rightChild = nodeJ
nodeC.leftChild = nodeF
nodeC.rightChild = nodeG
nodeF.rightChild = nodeK
nodeG.rightChild = nodeL

let binaryTree : BinaryTree = BinaryTree.init(withRoot: nodeA)

let node1 = nodeE
let node2 = nodeG
print("The least common ancestor for node ",node1.name," and node ",node2.name," -> ",binaryTree.findLeastCommonAncestor(ForNode1: node1, andNode2: node2) )



