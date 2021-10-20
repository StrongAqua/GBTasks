//
//  main.swift
//  SwiftHw4
//
//  Created by aprirez on 10/20/21.
//

import Foundation

final class Node {
    
    var value: Int
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}

func hasCycle(_ head: Node?) -> Bool {
    if head == nil {
        return false
    }
    
    var slow = head
    var fast = head
    
    while fast?.next != nil && fast?.next?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            removeLoop(slow, head)
            return true
        }
    }
    
    return false
 }

func removeLoop(_ loopNode: Node?, _ head: Node?) {
    var ptr1 = loopNode
    var ptr2 = loopNode
    
    var k: Int = 1
    
    while ptr1?.next !== ptr2 {
        ptr1 = ptr1?.next
        k += 1
    }
    
    ptr1 = head
    ptr2 = head
    
    for _ in 0...k - 1 {
        ptr2 = ptr2?.next
    }
    
    while ptr2 !== ptr1 {
        ptr1 = ptr1?.next
        ptr2 = ptr2?.next
    }
    
    while ptr2?.next !== ptr1 {
        ptr2 = ptr2?.next
    }
    
    ptr2?.next = nil
}

var description: String {
    var text = "["
    var node = head
    while node.next != nil {
        text += "\(node.value)"
        node = node.next!
        if node.next != nil { text += ", " }
    }
    return text + ", \(node.value)]"
  }

func getOrCreateNode(_ head: Node, _ value: Int) -> Node {
    var tmp: Node? = head
    repeat {
        if tmp!.value == value {
            return tmp!
        }
        tmp = tmp!.next
    } while(tmp != nil)
    return Node(value: value)
}

var list = [1,2,3,4,5,2]
let head = Node(value: list.removeFirst())

var tail: Node? = head
repeat {
    let value = list.removeFirst()
    tail!.next = getOrCreateNode(head, value)
    tail = tail!.next
} while(list.count > 0)

print(hasCycle(head))
print(description)
