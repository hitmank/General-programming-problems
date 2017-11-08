class Graph{
    var isDirected : Bool
    var numberOfNodes : Int = 0
    var listOfVertices : [Int] = [Int]()
    var adjacencyList : [Int:[Int]] = [Int:[Int]]()
    
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
    func addEdge(between node1:Int, and node2:Int) {
        
        if !listOfVertices.contains(node1) {
            listOfVertices.append(node1)
            numberOfNodes = listOfVertices.count
        }
        if !listOfVertices.contains(node2) {
            listOfVertices.append(node2)
            numberOfNodes = listOfVertices.count
        }
        
        if var list = adjacencyList[node1]{
            if !list.contains(node2) {
                list.append(node2)
                adjacencyList[node1] = list
            }
        }
        else{
            adjacencyList[node1] = [node2]
        }
        if !self.isDirected {
            if var list = adjacencyList[node2]{
                if !list.contains(node1) {
                    list.append(node1)
                    adjacencyList[node2] = list
                }
            }
            else{
                adjacencyList[node2] = [node1]
            }
        }
    }
    
    
    func findConnectedComponents()->[[Int]]{
        var components = [[Int]]()
        var visited = [Bool]()
        for _ in self.listOfVertices{
            visited.append(false)
        }
        for (index,vertex) in self.listOfVertices.enumerated(){
            if !visited[index] {
                //perform BFS
                // Get the nodes that were visited in this run of BFS. They form a connected component.
                // Append to final answer
                
                var queue = Queue<Int>()
                let nodesReached = performBFS(from: vertex, queue: &queue, visited: &visited)
                components.append(nodesReached)
            }
        }
        return components
    }
    
    private func performBFS(from vertex: Int, queue: inout Queue<Int>, visited: inout [Bool])->[Int]{
        var nodesReached = [Int]()
        
        queue.enqueue(element: vertex)
        
        while !queue.isEmpty() {
            
            let node = queue.dequeue()
            let id = listOfVertices.index(of: node)!
            if !visited[id] {
                visited[id] = true
                nodesReached.append(node)
                for eachNode in self.adjacencyList[node]!{
                    queue.enqueue(element: eachNode)
                }
            }
        }
        return nodesReached
    }
    
}

struct Queue<T>{
    var list : [T] = []
    mutating func enqueue(element : T){
        list.append(element)
    }
    mutating func dequeue()->T{
        return list.removeFirst()
    }
    func isEmpty()->Bool{
        return list.isEmpty
    }
}


//un-directed  graph
var G : Graph = Graph(directed: false)

G.addVertex(vertexId: 1)
G.addVertex(vertexId: 2)
G.addVertex(vertexId: 3)
G.addVertex(vertexId: 4)
G.addVertex(vertexId: 5)
G.addVertex(vertexId: 6)
G.addVertex(vertexId: 7)

G.addEdge(between: 1, and: 2)
G.addEdge(between: 2, and: 3)
G.addEdge(between: 1, and: 3)
G.addEdge(between: 3, and: 6)
G.addEdge(between: 4, and: 5)

for (index,component) in G.findConnectedComponents().enumerated(){
    print("Connected component #",index+1," -> ",component)
}






