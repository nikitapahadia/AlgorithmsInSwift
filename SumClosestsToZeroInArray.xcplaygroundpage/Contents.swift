//You are given an array of integers. Out of all the sums of two elements, return the one closest to 0

import Foundation

func sumClosestToZero(array:Array<Int>) -> Int // O(n^2)
{
    var sum = Int.max
    
    var start = 0
    var end = array.count - 1
    
    
    while start < end
    {
        let something = array[start] + array[end]
        if (abs(sum) > abs(something))
        {
            sum =  something
        }
        end--
        if (end <= start && start < array.count - 1)
        {
            start++
            end = array.count - 1
        }
    }
    
    return sum
}

sumClosestToZero([-5, 4, 3, -2, 1])


func quickSort(newArray: [Int])->Array<Int> {
    
    // newArray is an array of ints
    
    var less = [Int]()
    var equal = [Int]()
    var greater = [Int]()
    
    if newArray.count > 1{
        let pivot = newArray[0]
        
        for x in newArray {
            if x < pivot{
                less.append(x)
            }
            if x == pivot {
                equal.append(x)
            }
            if x > pivot {
                greater.append(x)
            }
        }
        return (quickSort(less)+equal+quickSort(greater))
        
    }
    else {
        return newArray
    }
}


//Sort and find : O(nlog n) + O(n)
func sumAfterSortClosestToZero(array:Array<Int>) -> Int
{
    let sortedArray = quickSort(array)
    
    var sum = Int.max
    
    for (var i = 1; i < sortedArray.count - 1; i++)
    {
        sum = min(sum, (array[i-1]+array[i]))
    }
    
    return sum
}

sumAfterSortClosestToZero([-5, 4, 3, -2, 1])




/*________________________________________*/




// 3 from array that sum to 0

func sumZero(array:Array<Int>) -> Array<Int>
{
    var ret = Array<Int>()
    
    var sum = 0;
    label:
        for (var i = 0; i < array.count; i++)
    {
        sum += array[i];
        
        for (var j = i+1; j < array.count; j++)
        {
            if(j == i) {continue}
            else {
                sum += array[j]
                print(sum)
                for (var k = j+1; k < array.count; k++)
                {
                    if(k == j){continue}
                    else if(k == i){continue}
                    else {
                        sum += array[k]
                        print(sum)
                        if(sum == 0)
                        {
                            print(i)
                            print(j)
                            print(k)
                            ret.append(array[i])
                            ret.append(array[j])
                            ret.append(array[k])
                            
                            break label;
                        }
                        sum -= array[k]
                    }
                }
                sum -= array[j]
            }
        }
        sum = 0
    }
    
    return ret
}

sumZero([0, 4, 6, -3, -1])



