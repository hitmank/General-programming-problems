class Node{
    var value : Int
    var leftChild : Node?
    var rightChild : Node?
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
    
    func getEachLevel()->[[Node]]{
        
        var finalAnswer : [[Node]] = [[Node]]()
        var currentLevel = 0
        let level1 = [root!]
        finalAnswer.append(level1)
        
        while(true){
            var level_list = [Node]()
            for i in 0...finalAnswer[currentLevel].count-1{
                
                let node = finalAnswer[currentLevel][i]
                
                if node.leftChild != nil{
                    level_list.append(node.leftChild!)
                }
                if node.rightChild != nil{
                    level_list.append(node.rightChild!)
                }
                
                
            }
            if level_list.count > 0{
                finalAnswer.append(level_list)
            }
            else{
                break;
            }
            currentLevel += 1
            
        }
        
        return finalAnswer
        
    }
    
}



let sorted_array = [3,5,10,23,80,95,96]

let root = createBSTWithMinimalHeight(using : sorted_array)
let myBST = BST(withRoot : root!)

let ans = myBST.getEachLevel()
for level in ans{
    print("----")
    for node in level{
        print(node.value)
    }
}




