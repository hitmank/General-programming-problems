
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
    
    func BFS(vertex : Int) {
        var queue  = Queue<Int>()
        var visited = [Bool]()
        for eachNode in listOfVertices{
            visited.append(false)
        }
        if !self.listOfVertices.contains(vertex){
            return
        }
        queue.enqueue(element: vertex)
        while !queue.isEmpty() {
            let element = queue.dequeue()
            let id = self.listOfVertices.index(of: element)!
            if !visited[id] {
                visited[id] = true
                print(" ",element)
                for eachNode in adjacencyList[element]!{
                    queue.enqueue(element: eachNode)
                }
            }
        }
        
    }
   
    
}

struct Queue<T>{
    var list = [T]()
    mutating func enqueue(element: T){
        list.append(element)
    }
    mutating func dequeue()->T{
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
graph.addVertex(vertexId: 13)

graph.addEdge(between: 5, and: 1)
graph.addEdge(between: 5, and: 6)
graph.addEdge(between: 5, and: 7)
graph.addEdge(between: 7, and: 9)
graph.addEdge(between: 9, and: 2)
graph.addEdge(between: 3, and: 4)
graph.addEdge(between: 5, and: 13)


graph.BFS(vertex: 5)

