import Foundation

// Quick Sort
// REF: http://en.wikipedia.org/wiki/Quicksort

public func quickSort<T: Comparable>(inout data: [T]){
    if data.count > 1{
        var less = [T]()
        var equal = [T]()
        var greater = [T]()

        var pivot = data[1]
        for x in data{
            if x < pivot{
                less.append(x)
            }else if x == pivot{
                equal.append(x)
            }else{
                greater.append(x)
            }
        }
        quickSort(&less)
        quickSort(&greater)

        data = less + equal + greater
    }
}

public func quickSortInPlace<T: Comparable>(inout data: [T]) {
    quickSortInPlace(&data, 0, data.count-1)
}
// Quick sort in place
private func quickSortInPlace<T: Comparable>(inout data: [T], start: Int, end: Int) {
    
    if start >= end {
        return
    }
    
    if data.count > 1 {
        var pivot = data[(start + end) / 2]
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
                
                swap(&data, left, right)
                left += 1
                right -= 1
            }
        }
        
        quickSortInPlace(&data, start, right)
        quickSortInPlace(&data, left, end)
    }
}

private func swap<T>(inout data: [T], from: Int, to: Int) {
    var tmp = data[from]
    data[from] = data[to]
    data[to] = tmp
}
