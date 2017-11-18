func reverseWords(inString input: inout String){
    
    var inputString = Array(input.characters)
    let length = inputString.count
    
    var startIndex = 0
    var endIndex = startIndex + 1
    
    while(true){
        if startIndex == length - 1{
            break
        }
        
        
        if endIndex > length - 1{
            break
        }
        if inputString[endIndex] == " " || endIndex == length-1{
            var tmp = Array(inputString[startIndex...endIndex-1])
            tmp = Array(tmp).reversed()
            inputString[startIndex...endIndex-1] = ArraySlice(tmp)
            startIndex = endIndex + 1
        }
        endIndex += 1
        
    }
    
    inputString = inputString.reversed()
    
    input = String(inputString)
    
}



var theString = "Hello, I like eero!"
print("Original string :", theString)

reverseWords(inString : &theString)

if(theString == "!eero like I Hello,"){
    print("After reversing :", theString)
    print("You are correct.")
}
else{
    print("After reversing :", theString)
    print("You are wrong!")
}

