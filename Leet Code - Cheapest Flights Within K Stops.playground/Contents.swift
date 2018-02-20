class Solution {
    var adjacencyMap : [Int:[flightInfo]] = [Int:[flightInfo]]()
    var currentReachable = [Int:reachedInfo]()
    func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
        var answer = -1;
        if(K == 0){
            var minDirectPath = 9999999
            for flight in flights{
                if((flight[0] == src) && (flight[1] == dst)){
                    minDirectPath = min(minDirectPath, flight[2])
                    answer = minDirectPath
                }
            }
            
        }
        else{
            for flight in flights{
                let newInfo = flightInfo(flight[2], reachableNode:flight[1])
                if let _ = adjacencyMap[flight[0]]{
                    adjacencyMap[flight[0]]!.append(newInfo)
                }
                else{
                    adjacencyMap[flight[0]] = [newInfo]
                }
            }
            
            for x in 0...n-1{
                currentReachable[x] = reachedInfo(999999, stopsNumber:0)
            }
            currentReachable[src] = reachedInfo(0, stopsNumber:-1)
            
            
            
            while(true){
                let currentNode = findMinimumCostNode()
                if currentNode == -1 {
                    return -1
                }
                let currentCost = currentReachable[currentNode]!.cost
                let currentNumberOfStops = currentReachable[currentNode]!.numberOfNodes
                if((currentNode == dst) && (currentNumberOfStops <= K)){
                    return currentCost
                }
                currentReachable[currentNode] = nil
                if(currentNumberOfStops > K){
                    return -1;
                }
                
                if let connectedNodes = adjacencyMap[currentNode]{
                    for connectedNode in connectedNodes{
                        let cost = connectedNode.cost
                        let node = connectedNode.node
                        if let info = currentReachable[node]{
                            if(!(info.numberOfNodes >= K)){
                                var newCost = 0
                                var didUpdate = false
                                if(info.cost > currentCost + cost){
                                    newCost = currentCost + cost
                                    didUpdate = true
                                }
                                else{
                                    newCost = info.cost
                                }
                                
                                
                                if(didUpdate){
                                    currentReachable[node] = reachedInfo(newCost, stopsNumber: currentNumberOfStops+1)
                                }
                                
                                
                            }
                        }
                    }
                }
                
            }
        }
        return answer;
    }
    
    func findMinimumCostNode()->Int{
        var min = 999999
        var minNode = -1
        for (key, value) in currentReachable{
            if(value.cost < min){
                min = value.cost
                minNode = key
            }
        }
        
        return minNode
    }
}

struct flightInfo{
    let cost : Int
    let node : Int
    init(_ dist: Int, reachableNode: Int){
        self.cost = dist
        self.node = reachableNode
    }
}
struct reachedInfo{
    let cost : Int
    let numberOfNodes : Int
    init(_ dist: Int, stopsNumber: Int){
        self.cost = dist
        self.numberOfNodes = stopsNumber
    }
}






var x = Solution()
var f = x.findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 0)
print(f)




