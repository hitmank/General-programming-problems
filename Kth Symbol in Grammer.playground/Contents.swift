class Solution {
    func kthGrammar(_ N: Int, _ K: Int) -> Int {
        var myStack = Stack<direction>()
        var currentLevel = N
        var currentIndex = K
        while(currentLevel != 1){
            if(currentIndex % 2 == 0){
                myStack.push(direction.right)
                currentIndex = currentIndex/2
            }
            else{
                myStack.push(direction.left)
                currentIndex = (currentIndex+1)/2
            }
            currentLevel = currentLevel - 1
        }
        
        var prev = 0
        var current = prev
        while(!myStack.isEmpty()){
            var currentDirection = myStack.pop()
            if(currentDirection == direction.left){
                if(prev == 0){
                    current = 0
                }
                else{
                    current = 1
                }
            }
            else if(currentDirection == direction.right){
                if(prev == 0){
                    current = 1
                }
                else{
                    current = 0
                }
            }
            prev = current
        }
        
        return current
    
    }
}
enum direction{
    case left
    case right
}
struct Stack<Element>{
    var array = [Element]()
    mutating func push(_ item: Element){
        array.append(item)
    }
    mutating func pop()->Element{
        return array.removeLast()
    }
    func isEmpty()->Bool{
        if(array.count == 0){
            return true
        }
        return false
    }
}
