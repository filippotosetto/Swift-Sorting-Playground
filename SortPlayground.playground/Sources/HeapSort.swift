import Foundation

// Heap Sort
// REF: http://en.wikipedia.org/wiki/Heapsort


public func heapSort<T: Comparable>(inout data: [T]){
    var swaps = [(Int, Int)]()
    heapSort(&data, &swaps)
}

public func heapSort<T: Comparable>(inout data: [T], inout swaps: [(Int, Int)]){
    
    // build max heap
    heapify(&data, data.count, &swaps)
    
    var end = data.count-1
    
    while end > 0{
        swap(&data[0], &data[end])
        
        swaps += [(0, end)]
        // heap size -1
        end--
        
        // restore heap property
        siftDown(&data, 0, end, &swaps)
    }
    
}

// put elements of array in heap order
private func heapify<T: Comparable>(inout data: [T], count: Int, inout swaps: [(Int, Int)]){
    
    // start is assigned the index in 'a' of the last parent node
    // the last element in a 0-based array is at index count-1
    // find parent of last element
    var start = Int(floor(Double(count-2)/2))
    
    while start >= 0{
        // sift down the node at index 'start' to the proper place such that all nodes below the start index are in heap order
        siftDown(&data, start, count-1, &swaps)
        // Go to next partent node
        start--
    }
}

// Repair the heap whose root element is at index 'start', assuming the heaps rooted at its children are valid
private func siftDown<T: Comparable>(inout data: [T], start: Int, end: Int, inout swaps: [(Int, Int)]){
    var root = start
    
    // While root has at least one child
    while (root * 2 + 1) <= end{
        let child = root * 2 + 1 // Left child
        var swapChild = root     // Child to swap with
        
        if data[swapChild] < data[child]{
            swapChild = child
        }
        
        // If right child exists and is greater
        if child+1 <= end && data[swapChild] < data[child+1]{
            swapChild = child+1
        }
        
        if swapChild == root{
            // Root holds the largest element, assume the heaps rooted children are valid
            // We are done
            return
        } else{
            swap(&data[root],&data[swapChild])
            
            swaps += [(root, swapChild)]
            
            root = swapChild // repeat to cont. sifting down the child
        }
        
    }
    
}
