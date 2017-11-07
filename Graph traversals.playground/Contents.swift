//: Playground - noun: a place where people can play

import UIKit

class Node : Hashable{
    static func ==(lhs: Node, rhs: Node) -> Bool {
        lhs.nodeValue > rhs.nodeValue
    }
    
    var nodeValue : Int = -1
    var children : [Node] = [Node]()
    init(value :Int, children : [Node]){
        self.nodeValue = value
        self.children = children
    }
    var hashValue: Int = self.nodeValue

}
class Graph{
    var numberOfNodes : Int = 0
    var nodes : Set<Node> = Set<Node>()
    
}

let newNode = Node(value: 50, children: [])
print(newNode.nodeValue)

