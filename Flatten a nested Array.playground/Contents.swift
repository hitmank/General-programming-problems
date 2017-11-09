func flatten(array arr:[Any],  answer : inout [Int]){
    
    for element in arr{
        if let number = element as? Int{
            answer.append(number)
        }
        else if let subArray = element as? [Any]{
            flatten(array: subArray, answer: &answer)
        }
    }
    
    
}

let input : [Any] = [[4,5],1,[5,[90,1],4],[[14,60],[5,[[12,11]]]]]
var answer = [Int]()
flatten(array: input, answer: &answer)
print("Original Nested Array : ")
print(input)
print("\nAfter flatten :")
print(answer)
