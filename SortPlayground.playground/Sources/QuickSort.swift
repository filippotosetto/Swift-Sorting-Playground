import Foundation

// Quick Sort
// REF: http://en.wikipedia.org/wiki/Quicksort

public func quickSort<T: Comparable>(inout data: [T]){
    if data.count > 1{
        var less = [T]()
        var equal = [T]()
        var greater = [T]()

        let pivot = data[1]
        for x in data{
            if x < pivot {
                less.append(x)
            } else if x == pivot {
                equal.append(x)
            } else {
                greater.append(x)
            }
        }
        quickSort(&less)
        quickSort(&greater)

        data = less + equal + greater
    }
}

public func quickSortInPlace<T: Comparable>(inout data: [T]) {
    var swaps = [(Int, Int)]()
    quickSortInPlace(&data, 0, data.count-1, &swaps)
}

public func quickSortInPlace<T: Comparable>(inout data: [T], inout swaps: [(Int, Int)]) {
    quickSortInPlace(&data, 0, data.count-1, &swaps)
}
// Quick sort in place
private func quickSortInPlace<T: Comparable>(inout data: [T], start: Int, end: Int, inout swaps: [(Int, Int)]) {
    
    if start >= end {
        return
    }
    
    if data.count > 1 {
        let pivot = data[(start + end) / 2]
        var left: Int = start
        var right: Int = end
        
        while left <= right {
            while data[left] < pivot {
                left += 1
            }
            while data[right] > pivot {
                right -= 1
            }
            
            if left <= right {
                swaps += [(left, right)]
                swap(&data, left, right)
                left += 1
                right -= 1
            }
        }
        
        quickSortInPlace(&data, start, right, &swaps)
        quickSortInPlace(&data, left, end, &swaps)
    }
}

private func swap<T>(inout data: [T], from: Int, to: Int) {
    let tmp = data[from]
    data[from] = data[to]
    data[to] = tmp
}
