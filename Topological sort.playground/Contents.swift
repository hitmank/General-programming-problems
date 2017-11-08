
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
    func mainTopologicalSort(){
      
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
            print(stack.pop())
        }
    }
    private func topologicalSort(vertex:Int, stack : inout Stack<Int>, visited: inout [Bool]){
        let id = listOfVertices.index(of: vertex)!
        visited[id] = true
        for eachNode in adjacencyList[vertex]!{
            let id = listOfVertices.index(of: eachNode)!
            if !visited[id]{
                topologicalSort(vertex: eachNode, stack: &stack, visited: &visited)
            }
        }
        stack.push(element: vertex)
        
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
graph.addVertex(vertexId: 5)
graph.addVertex(vertexId: 1)
graph.addVertex(vertexId: 4)
graph.addVertex(vertexId: 2)
graph.addVertex(vertexId: 0)
graph.addVertex(vertexId: 3)


graph.addEdge(between: 5, and: 0)
graph.addEdge(between: 5, and: 2)
graph.addEdge(between: 4, and: 0)
graph.addEdge(between: 4, and: 1)
graph.addEdge(between: 2, and: 3)
graph.addEdge(between: 3, and: 1)

print("Topologocal ordering :\n")
graph.mainTopologicalSort()


