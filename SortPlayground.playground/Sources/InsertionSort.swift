import Foundation

// Insertion Sort
// REF: http://en.wikipedia.org/wiki/Insertion_sort

public func insertionSort<T: Comparable>(inout data: [T]) {
    for i in 1..<data.count {
        var x = data[i]
        var j = i
        while j > 0 && data[j-1] > x {
            data[j] = data[j-1]
            j--
        }
        data[j] = x
    }
}


// Slower version
//public func insertionSort<T: Comparable>(inout data: [T]){
//    for i in 0..<data.count {
//        var j:Int = i
//        while j > 0 && data[j - 1] > data[j] {
//            swap(&data[j], &data[j-1])
//            j--
//        }
//    }
//}
