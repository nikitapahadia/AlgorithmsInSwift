//Linked List

import Foundation

class Node<T>
{
    var previous:Node<T>?
    var next:Node<T>?
    var value:T
    
    init(value:T)
    {
        self.value = value
    }
}

class SinglyLinkedList<T where T:Equatable>
{
    var head:Node<T>
    
    init(headValue:T)
    {
        head = Node<T>(value: headValue)
    }
    
    func add(val:T) //or addToTail
    {
        let node = Node(value: val)

        var current:Node<T> = head
        
        while(current.next != nil)
        {
            current = current.next!
        }
        
        current.next = node
    }
    
    func delete(val:T)
    {
        var current:Node<T> = head
        var previous:Node<T>?
        print(current.value)
        print(val)
        while(current.value != val)
        {
            previous = current
            current = current.next!
            
        }
        if current.value == val
        {
            previous?.next = current.next
            if previous == nil
            {
                head = current.next!
            }
        }
    }
    
    func count() -> Int
    {
        var count:Int = 0
        
        var current:Node<T>? = head
        var arr = Array<T>() // for testing
        while (current != nil)
        {
            count++
            arr.append((current?.value)!)
            current = current?.next
        }
        print(arr)
        return count
    }
    
    func removeDuplicate() //O(n^2)
    {
        if head.next == nil
        {
            return
        }
        var current:Node<T>? = head
        var p2:Node<T>? = current?.next!
        
        while(current != nil)
        {
            while(p2 != nil)
            {
                if current?.value == p2?.value
                {
                    p2?.previous?.next = p2?.next
                }
                p2 = p2?.next!
            }
            current = current?.next
            p2 = current?.next
        }
    }
    
    func findKthToLastElement(k:Int) -> T
    {
        let length:Int = count()
        
        //if k > length, return -1
        
        var current:Node<T> = head

        for (var i = 1; i <= length - k; i++)
        {
            current = current.next!
        }
        
        return current.value
    }
    
    func findKthToLastElementWithoutCount(k:Int) -> T // more efficient
    {
        var p1:Node<T> = head
        var p2:Node<T>? = head
        
        for (var i = 0; i < k; i++)
        {
            //if p2 is nil here, invalid k
            p2 = p2?.next! // p2 is at kth from the start, now p1 and p2 have a difference of k indices.
        }
        print(p2?.value)
        while (p2 != nil)
        {
            p1 = p1.next!
            p2 = p2?.next
        }
        
        return p1.value
    }
}

class DoublyLinkedList<T where T:Equatable>
{
    var head:Node<T>
    
    init(headValue:T)
    {
        head = Node<T>(value: headValue)
    }
    
    func add(val:T) //or addToTail
    {
        let node = Node(value: val)
        
        var current:Node<T> = head
        
        while(current.next != nil)
        {
            current = current.next!
        }
        
        current.next = node
        node.previous = current
    }
    
    func delete(val:T)
    {
        var current:Node<T> = head
        
        while(current.value != val)
        {
            current = current.next!
            
        }
        if current.value == val
        {
            current.previous?.next = current.next
            current.next?.previous = current.previous
        }
    }
}



var linkedList = SinglyLinkedList<Int>(headValue: 9)
linkedList.add(4)
linkedList.add(6)
linkedList.add(8)
//linkedList.delete(4)
//linkedList.delete(9)
linkedList.count()
linkedList.findKthToLastElementWithoutCount(2)


