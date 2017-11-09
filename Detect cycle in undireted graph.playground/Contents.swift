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
    
    func doIHaveACycle()->Bool{
        var visited : [Bool] = [Bool].init(repeating: false, count: self.listOfVertices.count)
        for (index,node) in self.listOfVertices.enumerated(){
            if !visited[index]{
                
                if runDFS(from: node, visited: &visited, parent : nil){
                    return true
                }
                
            }
        }
        return false
    }
    
    private func runDFS(from root: Int, visited: inout [Bool], parent: Int?)->Bool{
        
        let id = self.listOfVertices.index(of :root)!
        visited[id] = true
        
        for child in self.adjacencyList[root]!{
            let index = self.listOfVertices.index(of: child)!
            if visited[index] && parent != child{
                return true
            }
            if !visited[index]{
                
                if runDFS(from: child, visited: &visited, parent: root){
                    return true
                }
            }
        }
        
        return false
    }
    
    
}




//un-directed  graph
var G : Graph = Graph(directed: false)

G.addVertex(vertexId: 1)
G.addVertex(vertexId: 2)
G.addVertex(vertexId: 3)
G.addVertex(vertexId: 4)
G.addVertex(vertexId: 5)


G.addEdge(between: 1, and: 2)
G.addEdge(between: 2, and: 3)
G.addEdge(between: 3, and: 5)
G.addEdge(between: 3, and: 4)
G.addEdge(between: 5, and: 4)

print("Does the graph have a cycle? -> Definately",G.doIHaveACycle())








