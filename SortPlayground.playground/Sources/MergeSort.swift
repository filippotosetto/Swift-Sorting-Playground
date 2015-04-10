import Foundation

// Insertion Sort
// REF: http://en.wikipedia.org/wiki/Insertion_sort

public func mergeSort<T: Comparable>(inout array: [T]){
    if array.count <= 1{
        return
    }
    
    // Split lists into equal sized sublists
    let middle = array.count / 2
    
    var left = [T]()
    var right = [T]()
    
    for x in 0..<middle{
        left.append(array[x])
    }
    
    for y in middle..<array.count{
        right.append(array[y])
    }
    
    // Recursively sort sublists
    mergeSort(&left)
    mergeSort(&right)
    
    // Merge the sorted sublists
    array = merge(&left,&right)
}


// Merges two lists
func merge<T: Comparable>(inout left: [T], inout right:[T])-> [T]{
    
    var result = [T]()
    
    // Merge taking lowest value first seen
    while (!left.isEmpty && !right.isEmpty){
        if left[0] <= right[0]{
            result.append(left[0])
            left.removeAtIndex(0)
        }else{
            result.append(right[0])
            right.removeAtIndex(0)
        }
    }
    
    // Handle remaining elements
    while !left.isEmpty{
        result.append(left[0])
        left.removeAtIndex(0)
    }
    while !right.isEmpty{
        result.append(right[0])
        right.removeAtIndex(0)
    }
    
    return result
}
