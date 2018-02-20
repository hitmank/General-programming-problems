class Solution {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        var nodeToColorMap = [Int:NodeColor]()
        let numberOfNodes = graph.count
        for itr in 0...numberOfNodes-1{
            nodeToColorMap[itr] = NodeColor.noColor
        }
        
        for (index, value) in graph.enumerated(){
            if var color = nodeToColorMap[index]{
                if((color == NodeColor.noColor) || (color == NodeColor.red)){
                    nodeToColorMap[index] = NodeColor.red
                    for adjacentNode in value{
                        if let adjacentNodeColor = nodeToColorMap[adjacentNode]{
                            if adjacentNodeColor == NodeColor.noColor{
                                nodeToColorMap[adjacentNode] = NodeColor.blue
                            }
                            else if adjacentNodeColor == NodeColor.red{
                                return false
                            }
                        }
                    }
                }
                else if(color == NodeColor.blue){
                    for adjacentNode in value{
                        if let adjacentNodeColor = nodeToColorMap[adjacentNode]{
                            if adjacentNodeColor == NodeColor.noColor{
                                nodeToColorMap[adjacentNode] = NodeColor.red
                            }
                            else if adjacentNodeColor == NodeColor.blue{
                                return false
                            }
                        }
                    }
                }
            }
        }
        
        
        return true
    }
}

struct Stack<Element>{
    var array = [Element]()
    mutating func push(_ value:Element){
        array.append(value)
    }
    mutating func pop()->Element{
        return array.removeLast()
    }
    func isEmpty()->Bool{
        if(array.count == 0){
            return true
        }
        return false
    }
}

enum NodeColor{
    case noColor
    case red
    case blue
}

var g = Solution()

print(g.isBipartite([[1,3], [0,2], [1,3], [0,2]]))
