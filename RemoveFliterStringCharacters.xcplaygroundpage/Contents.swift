
import Foundation

//@problem: Given a string, remove all chars from the string that are present in say another string called filter

var str = "Hello, playground"

var filter = "Hello, a"

func removeChar(string:String, filter:String) -> String
{
    var newString = String()
    
    for ch:Character in string.characters
    {
        print(ch)
        if(!filter.characters.contains(ch))
        {
            newString = newString + String(ch)
        }
    }
    
    return newString
}

removeChar(str, filter: filter)//O(n.m)


