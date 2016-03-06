
import Foundation

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

//Protocol for the Kth Largest class
public protocol KthLargestProtocol
{
    // @param: k: the number of largest elements needed
    // @return: the k largest elements in the array sorted
    // @throws: if invalid return
    func getKLargest(k: Int) throws -> [Int]
    
    // @param: element: element added in the array.
    func add(element: Int)
    
    // Empties array.
    func clear()
}
enum KthLargestError: ErrorType {
    case InvalidNumber
}

// Class Kth Largest conforming to Kth Largest Protocol
class KthLargest : KthLargestProtocol
{
    
    // Creating a singleton instance
    static let sharedInstance = KthLargest()
    private init() {} //this will prevent creating an instance
    
    //Variables in this class
    private var _elements:[Int]?
    
    var elements:[Int]? {
        get {
            if _elements == nil
            {
                _elements = [Int]()
            }
            return _elements
        }
        set {
            _elements = newValue
        }
    }
    
    
    //MARK: Protocol Methods
    
    func getKLargest(k: Int) throws -> [Int] {
        
        guard k > 0 else
        {
            throw KthLargestError.InvalidNumber
        }
        
        var returnArray = quickSort(elements!)
        
        let numbersToDelete = returnArray.count - k
        guard numbersToDelete >= 0 else
        {
            throw KthLargestError.InvalidNumber
        }
        if numbersToDelete > 0
        {
            let maxIndexToDelete:Int = returnArray.count - k - 1
            let range = 0...maxIndexToDelete
            
            returnArray.removeRange(range)
        }
        
        return returnArray
    }
    
    func add(element: Int) {
        elements!.append(element)
    }
    
    func clear() {
        // removeAll()can also be used
        elements = nil
    }
}


var largest = KthLargest.sharedInstance
largest.add(5)
largest.add(3)
largest.add(53)
largest.add(32)
largest.add(-51)
largest.add(-3)
var got = try largest.getKLargest(3)

