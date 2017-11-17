struct Stack<T>{
    var name = ""
    var arr  = [T]()
    mutating func push(val : T){
        arr.insert(val, at: 0)
    }
    mutating func pop()->T{
        return arr.removeFirst()
    }
    func isEmpty()->Bool{
        return arr.count == 0
    }
    mutating func moveTopTo(stack : inout Stack<Int>){
        let top = self.pop()
        print("Moving element ", top," from ", self.name ," to ", stack.name)

        stack.push(val : top as! Int)
       
        
    }
    func showElements(){
        
        for element in arr{
            print(element)
        }
    }
}
var stack1 = Stack<Int>()
stack1.name = "1"
stack1.push(val : 30)
stack1.push(val : 20)
stack1.push(val : 10)

var stack2 = Stack<Int>()
stack2.name = "2"
var stack3 = Stack<Int>()
stack3.name = "3"

func moveDisks(number n : Int, from source: inout Stack<Int>, using buffer: inout Stack<Int>, to destination: inout Stack<Int>){
    if(n>0){
        moveDisks(number : n-1, from : &source, using : &destination, to : &buffer)
        source.moveTopTo(stack : &destination)
        moveDisks(number : n-1, from : &buffer, using : &source, to : &destination)
    }
}





print("Before : ")
print("\nStack 1 :")
stack1.showElements()
print("\nStack 2 :")
stack2.showElements()
print("\nStack 3 :")
stack3.showElements()

moveDisks(number : 3, from : &stack1, using : &stack2, to : &stack3)

print("After : ")
print("\nStack 1 :")
stack1.showElements()
print("\nStack 2 :")
stack2.showElements()
print("\nStack 3 :")
stack3.showElements()


