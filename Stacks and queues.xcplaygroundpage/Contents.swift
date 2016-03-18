
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

class Stack<T>
{
    var top:Node<T>?
    
    func pop() -> Node<T>
    {
        let node = top
        top = top?.next
        return node!
    }
    
    func push(object:T)
    {
        let node = Node(value: object)
        node.next = top
        top = node
    }
}

class Queue<T>
{
    var first:Node<T>?
    var last:Node<T>?
    
    func enqueue(object:T)
    {
        let node = Node(value: object)
        node.next = last
        last = node
    }
    
    func dequeue() -> Node<T>
    {
        let node = first
        first = first?.next
        return node!
    }
}