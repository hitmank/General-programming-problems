class Solution {
    func isValid(_ s: String) -> Bool {
        var theStack = stack<Character>()
        for bracket in s{
            if(bracket == "(" || bracket == "[" || bracket == "{"){
                theStack.push(bracket)
            }
            else{
                if let popedElement = theStack.pop(){
                    if(bracket == ")" && popedElement != "("){
                        return false
                    }
                    if(bracket == "]" && popedElement != "["){
                        return false
                    }
                    if(bracket == "}" && popedElement != "{"){
                        return false
                    }
                }
                else{
                    return false
                }
            }
        }
        if(theStack.peek()){
            return false;
        }
        return true;
    }
}

struct stack<Element>{
    var array : [Element] = [Element]()
    mutating func push(_ item:Element){
        array.append(item)
    }
    mutating func pop()->Element?{
        if(array.count != 0){
            return array.removeLast()
        }
        else{
            return nil
        }
    }
    func peek()->Bool{
        if(array.count > 0){
            return true
        }
        return false
    }
}
