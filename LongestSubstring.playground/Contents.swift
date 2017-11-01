
//: Playground - noun: a place where people can play

import UIKit
//Using a Set of characters
//Complexity : O(n)
func findLongestSubstring(theString : String)->Int{
    
    let sizeOfString = theString.count;
    var characterSet : Set<Character> = Set<Character>();
    var i = 0, j = 0, ans = 0;
    while i < sizeOfString && j < sizeOfString {
        let theChar = theString[String.Index.init(encodedOffset: j)]
        if characterSet.contains(theChar) {
            characterSet.remove(theChar)
            i += 1;
            continue;
        }
        characterSet.insert(theChar)
        j += 1;
        ans = max(ans, j - i );
        
    }
    
    
    return ans;
}

//Here, we dont just increment i by 1.
//We smartly increment by moving it to the value after the duplicate is found
func findLongestSubstringOptimizedWithIndex(theString : String)->Int{

    let sizeOfString = theString.count;
    var charToIndexDict : Dictionary<Character,Int> = Dictionary<Character,Int>()
    var i = 0,j = 0,ans = 0
    while i < sizeOfString && j < sizeOfString {
        let theChar = theString[String.Index.init(encodedOffset: j)]
        if charToIndexDict.keys.contains(theChar) {
            i = max(charToIndexDict[theString[String.Index.init(encodedOffset: j)]]!, i)
        }
        j += 1
        ans = max(ans, j - i)
        charToIndexDict[theChar] = j
        
    }
    
    return ans;
}

let answer = findLongestSubstring(theString: "abacfegssa");
let ans = findLongestSubstringOptimizedWithIndex(theString: "abacfegssa")
print("The longest substring is : " + String(answer));
print("The longest (Optimized) substring is : " + String(ans));

