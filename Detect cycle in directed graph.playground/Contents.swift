
class Graph{
    var isDirected : Bool
    var numberOfNodes : Int = 0
    var listOfVertices : [Int] = [Int]()
    // Node ->[(Node,Weight)]
    var adjacencyList : [Int:[(Int,Int)]] = [Int:[(Int,Int)]]()
    
    init(directed : Bool) {
        self.isDirected = directed
    }
    
    func addVertex(vertexId id : Int){
        
        if listOfVertices.contains(id) {
            return;
        }
        else{
            listOfVertices.append(id)
            adjacencyList[id] = []
        }
        numberOfNodes = listOfVertices.count
        
    }
    func addEdge(between node1:Int, and node2:Int, withWeight weight: Int) {
        
        if !listOfVertices.contains(node1) {
            listOfVertices.append(node1)
            numberOfNodes = listOfVertices.count
        }
        if !listOfVertices.contains(node2) {
            listOfVertices.append(node2)
            numberOfNodes = listOfVertices.count
        }
        
        if var list = adjacencyList[node1]{
            var contains : Bool = false
            var indexOfElement : Int = -1
            for (index,eachEdge) in list.enumerated(){
                if eachEdge.0 == node2 {
                    contains = true
                    indexOfElement = index
                    break
                }
            }
            
            if contains {
                list.remove(at: indexOfElement)
            }
            list.append((node2,weight))
            adjacencyList[node1] = list
        }
        else{
            adjacencyList[node1] = [(node2,weight)]
        }
    }
    
    
    func doIhaveACycle()->Bool{
        
        var visited : [Bool] = [Bool](repeating: false,count: self.listOfVertices.count)
        var whiteSet : Set<Int> = Set<Int>()
        var greySet : Set<Int> = Set<Int>()
        var blackSet : Set<Int> = Set<Int>()
        
        for vertex in self.listOfVertices{
            whiteSet.insert(vertex)
        }
        
        for (index,node) in self.listOfVertices.enumerated(){
            
            if !visited[index] {
                let ans = runDFS(from: node, visited: &visited, whiteGroup: &whiteSet, greyGroup: &greySet, blackGroup: &blackSet)
                if ans {
                    return ans
                }
            }
        }
        return false
        
    }
    
    private func runDFS(from node: Int, visited: inout [Bool], whiteGroup: inout Set<Int>, greyGroup: inout Set<Int>, blackGroup: inout Set<Int>)->Bool{
        
        if greyGroup.contains(node){
            return true
        }
        whiteGroup.remove(node)


        greyGroup.insert(node)
        let id = self.listOfVertices.index(of:node)!
        visited[id] = true
        
        for (child,weight) in self.adjacencyList[node]!{
            
            if !blackGroup.contains(child){
                if runDFS(from: child, visited: &visited, whiteGroup: &whiteGroup, greyGroup: &greyGroup, blackGroup: &blackGroup){
                    return true
                }
                
                
            }
            
        }
        
        greyGroup.remove(node)
        blackGroup.insert(node)
        return false
    }
    
    
}


var G = Graph.init(directed: true)
G.addVertex(vertexId: 1)
G.addVertex(vertexId: 2)
G.addVertex(vertexId: 3)
G.addVertex(vertexId: 4)
G.addVertex(vertexId: 5)
G.addVertex(vertexId: 6)
G.addEdge(between: 1, and: 2, withWeight: 1)
G.addEdge(between: 3, and: 2, withWeight: 1)
G.addEdge(between: 1, and: 4, withWeight: 1)
G.addEdge(between: 4, and: 5, withWeight: 1)
G.addEdge(between: 5, and: 6, withWeight: 1)
G.addEdge(between: 6, and: 4, withWeight: 1)

print("Does the graph have a cycle? ->",G.doIhaveACycle())





