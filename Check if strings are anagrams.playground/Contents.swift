func areTheyAnagrams(string1 : String, string2 : String) -> Bool{
    
    if string1.count != string2.count{
        return false
    }
    
    let str1 = Array(string1.characters)
    let str2 = Array(string1.characters)
    
    var characterCount : [Character : Int] = [Character : Int]()
    
    for element in str1{
        if let count = characterCount[element]{
            characterCount[element] = count + 1
        }
        else{
            characterCount[element] = 1
        }
    }
    
    for element in str2{
        if let count = characterCount[element]{
            if count == 1{
                characterCount[element] = nil
            }
            else{
                characterCount[element] = count - 1
            }
        }
        else{
            return false
        }
    }
    
    if characterCount.keys.count > 0{
        return false
    }
    
    return true
    
}

let string1 = "hello!"
let string2 = "elhl!o"
let string3 = "hello!2"

if areTheyAnagrams(string1 : string1, string2 : string2){
    print("Yes, they are and you are correct")
}
else{
    print("You are wrong")
}
if !areTheyAnagrams(string1 : string1, string2 : string3){
    print("No, they are not and you are correct")
}
else{
    print("You are wrong")
}
