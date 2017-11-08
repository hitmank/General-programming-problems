enum Approach{
    case recursion
    case iteration
}

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
    func DFSMain(vertex: Int, using approach:Approach){
        if !listOfVertices.contains(vertex) {
            return
        }
        var visited = [Bool]()
        for eachNode in self.listOfVertices{
            visited.append(false)
        }
        switch approach {
        case .recursion:
            self.recursiveDFS(vertex: vertex, visited: &visited)
        case .iteration:
            self.iterativeDFS(vertex: vertex, visited: &visited)
        }
    }
    private func iterativeDFS(vertex: Int, visited: inout[Bool]){
        var stack = Stack<Int>()
        stack.push(element: vertex)
        
        while !stack.isEmpty() {
            
            let element = stack.pop()
            let id = self.listOfVertices.index(of: element)!
            if !visited[id]{
                visited[id] = true
                print(" ", element)
            }
            for eachNode in self.adjacencyList[element]!{
                stack.push(element: eachNode)
            }
            
        }
    }
    private func recursiveDFS(vertex : Int, visited: inout[Bool]) {
        
        let id = self.listOfVertices.index(of: vertex)!
        if visited[id] {
            return
        }
        else{
            visited[id] = true
            print(" ",vertex," ")
        }
        
        for eachNode in adjacencyList[vertex]!{
            recursiveDFS(vertex: eachNode, visited: &visited)
        }
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
graph.addVertex(vertexId: 6)
graph.addVertex(vertexId: 9)
graph.addVertex(vertexId: 7)
graph.addVertex(vertexId: 4)
graph.addVertex(vertexId: 3)
graph.addVertex(vertexId: 2)
graph.addEdge(between: 5, and: 1)
graph.addEdge(between: 5, and: 6)
graph.addEdge(between: 5, and: 7)
graph.addEdge(between: 7, and: 9)
graph.addEdge(between: 9, and: 2)
graph.addEdge(between: 3, and: 4)

print("DFS with recursion")
graph.DFSMain(vertex: 5, using: .recursion)

print("DFS with iteration")
graph.DFSMain(vertex: 5, using: .iteration)















