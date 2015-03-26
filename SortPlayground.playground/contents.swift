import Foundation




//: ## Compare Sorting Algorithms

func compare(arraySize: UInt32) {
    let numbers = createRandomNumbersArray(arraySize)

    var mergeSortNumbers = numbers
    var quickSortNumbers = numbers
    var quickSortInPlaceNumbers = numbers
    var heapSortNumbers = numbers
    var insertionSortNumbers = numbers

    //: Merge Sort
    let mergeSortRunningTime = TimePerformer().run { () -> () in
        mergeSort(&mergeSortNumbers)
    }
    
    //: Quick Sort
    let quickSortRunningTime = TimePerformer().run { () -> () in
        quickSort(&quickSortNumbers)
    }
    
    //: Quick Sort in Place
    let quickSortInPlaceRunningTime = TimePerformer().run { () -> () in
        quickSortInPlace(&quickSortInPlaceNumbers)
    }
    
    //: Heap Sort
    let heapSortRunningTime = TimePerformer().run { () -> () in
        heapSort(&heapSortNumbers)
    }
    
    //: Insertion Sort
    let insertionSortRunningTime = TimePerformer().run { () -> () in
        insertionSort(&insertionSortNumbers)
    }

    println()
    println("Array Size:           \(arraySize)")
    println("Merge Sort:           \(mergeSortRunningTime)")
    println("Quick Sort:           \(quickSortRunningTime)")
    println("Quick Sort In Place:  \(quickSortInPlaceRunningTime)")
    println("Heap Sort:            \(heapSortRunningTime)")
    println("Insertion Sort:       \(insertionSortRunningTime)")
    println()
    
}

compare(10)
compare(100)
compare(1000)
compare(10000)
//compare(100000)
 
