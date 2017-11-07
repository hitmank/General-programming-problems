//: Playground - noun: a place where people can play

import UIKit

//Convert Binary tree to DLL

class Node{
    
    var value : Int
    var leftChild : Node? = nil
    var rightChild : Node? = nil
    init( val : Int){
        self.value = val
    }
    
}

let root  = Node(val :10)
let node1  = Node(val :12)
let node2  = Node(val :15)
let node3  = Node(val :25)
let node4  = Node(val :30)
let node5  = Node(val :36)
let node6  = Node(val :3)
let node7  = Node(val :19)
let node8  = Node(val :12)
let node9  = Node(val :6)
let node10  = Node(val :8)

root.leftChild = node1
root.rightChild = node2
node1.leftChild = node3
node1.rightChild = node4
node2.leftChild = node5
node2.rightChild = node6
node3.leftChild = node7
node4.leftChild = node8
node5.leftChild = node9
node6.rightChild = node10

func inorderTraversal(root : Node?){
    if root == nil{
        return
    }
    inorderTraversal(root: root!.leftChild)
    print(root!.value)
    inorderTraversal(root: root!.rightChild)
}

print("Normal inorder traversal of the binary tree :")
inorderTraversal(root: root)
var prev : Node? = nil
var head : Node? = nil

func convertToDLL(root: Node?){
    if root == nil{
        return
    }
    convertToDLL(root: root!.leftChild)
    if prev == nil {
        head = root!
    }
    else{
        prev?.rightChild = root
    }
    root!.leftChild = prev
    prev = root
    convertToDLL(root: root!.rightChild)
    
}
func printDLL(head : Node){
    var currNode : Node? = head
    while currNode != nil {
        print(currNode!.value)
        currNode = currNode!.rightChild
    }
}

convertToDLL(root: root)
print("The Doubly linked List")
printDLL(head: head!)



