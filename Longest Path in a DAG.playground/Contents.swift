
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
//        if !self.isDirected {
//            if var list = adjacencyList[node2]{
//                if !list.contains(node1) {
//                    list.append(node1)
//                    adjacencyList[node2] = list
//                }
//            }
//            else{
//                adjacencyList[node2] = [node1]
//            }
//        }
        
    }
    func mainTopologicalSort()->[Int]{
        var topologicalOrdering = [Int]()
        var visited = [Bool]()
        for _ in self.listOfVertices{
            visited.append(false)
        }
        var stack = Stack<Int>()
        for eachNode in self.listOfVertices {
            let id = listOfVertices.index(of: eachNode)!
            if !visited[id]{
                self.topologicalSort(vertex: eachNode, stack: &stack, visited: &visited)
            }
        }
        while !stack.isEmpty(){
            topologicalOrdering.append(stack.pop())
        }
        return topologicalOrdering
    }
    private func topologicalSort(vertex:Int, stack : inout Stack<Int>, visited: inout [Bool]){
        let id = listOfVertices.index(of: vertex)!
        visited[id] = true
        for eachNode in adjacencyList[vertex]!{
            let id = listOfVertices.index(of: eachNode.0)!
            if !visited[id]{
                topologicalSort(vertex: eachNode.0, stack: &stack, visited: &visited)
            }
        }
        stack.push(element: vertex)
        
    }
    func findLongestPath(from source: Int, withGraph graph: Graph)->[(Int,Int)]{
        var answer = [(Int,Int)]()
        let topologicalOrder = graph.mainTopologicalSort()
        var dist = [Int].init(repeating: Int.min, count: topologicalOrder.count)
        let id = topologicalOrder.index(of: source)!
        dist[id] = 0
        
        for eachNode in topologicalOrder{
            let sourceId = topologicalOrder.index(of: eachNode)!
            for (adjacentNode,weight) in self.adjacencyList[eachNode]!{
                let nodeId = topologicalOrder.index(of: adjacentNode)!
                if dist[nodeId] < dist[sourceId] + weight{
                    dist[nodeId]  = dist[sourceId] + weight
                }
            }
        }
        
        for (index,eachDistance) in dist.enumerated(){
            var dist = -1
            if eachDistance < 0 {
                dist = -1
            }
            else{
                dist = eachDistance
            }
            answer.append((topologicalOrder[index],dist))
        }
        
        return answer
    }
}

struct Stack<T>{
    var list = [T]()
    mutating func push(element: T){
        list.insert(element, at: 0)
    }
    mutating func pop()->T{
        return list.removeFirst()
    }
    func isEmpty()->Bool{
        return list.isEmpty
    }
}




var graph : Graph = Graph(directed: true)
graph.addVertex(vertexId: 1)
graph.addVertex(vertexId: 2)
graph.addVertex(vertexId: 3)
graph.addVertex(vertexId: 4)



graph.addEdge(between: 1, and: 2, withWeight: 5)
graph.addEdge(between: 1, and: 3, withWeight: 2)
graph.addEdge(between: 2, and: 3, withWeight: 1)
graph.addEdge(between: 3, and: 4, withWeight: 1)

let sourceNode = 1 
let distances = graph.findLongestPath(from: sourceNode, withGraph: graph)

for eachDistance in distances{
    print("Longest Path from node ",sourceNode," to node :",eachDistance.0," is -> ",eachDistance.1)
}

