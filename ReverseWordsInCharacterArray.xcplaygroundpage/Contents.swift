// @problem: given a character array, reverse the words they form

import Foundation

var array: Array<Character> = [ "h", "o", "l", "i", "d", "a", "y", " ",  "y", "o", "u", "r", " ", "e", "n", "j", "o", "y"]

//MARK: Method 1: O(n) time complexity, O(n) space complexity

func reverse1(arr:Array<Character>)
{
    var ret = Array<String>()
    var words = Array<String>()
    var lastSpaceIndex = 0
    let space:Character = " "
    
    for i in 0...arr.count - 1
    {
        print(i)
        print(arr[i])
        
        let isEqual = (arr[i] == space)
        
        if isEqual || i == arr.count - 1
        {
            var lastIndex = i-1
            if i == arr.count - 1
            {
                lastIndex += 1
            }
            var word:String = ""
            for j in lastSpaceIndex...lastIndex
                {
                    word.appendContentsOf(String(arr[j]))
                }
            
            words.append(word)
            lastSpaceIndex = i+1
        }
    }
    
    print(words)
    
    for var i = words.count-1;i >= 0;i--
    {
        let word = words[i]
        
        for j in word.characters
        {
            ret.append(String(j))
        }
        if i != 0
        {
            ret.append(" ")
        }
    }
    
    print(ret)
}

reverse1(array)


//MARK: Method 2, using mirror swaping O(n) time complexity, O(1) space complexity

func swap(var arr:Array<Character>, var start: Int,var end:Int) -> Array<Character>
{
    while(start < end)
    {
        let c = arr[start]
        arr[start] = arr[end]
        arr[end] = c
        start++
        end--
    }
    
    return arr
}


func reverse(var arr:Array<Character>)
{
    arr = swap(arr, start: 0, end: arr.count-1)
    
    print(arr)
    
    var wordStart = 0
    var wordEnd = 0
    for i in 0...arr.count-1
    {
        if i == arr.count - 1
        {
            wordEnd = i
            
             arr = swap(arr, start: wordStart, end: wordEnd)
        }
         else if arr[i] == " "
        {
            wordEnd = i - 1
            
            arr = swap(arr, start: wordStart, end: wordEnd)
            
            wordStart = i+1
        }
    }
    print(arr)
}

reverse(array)



