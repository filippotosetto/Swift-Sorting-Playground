import Foundation


//: ## Compare Sorting Algorithms Visually
func visualCompare(numbers: [Int]) {
    var quickSortInPlaceNumbers = numbers
    var heapSortNumbers = numbers
    var insertionSortNumbers = numbers

    //: Quick Sort in Place
    var quickSortInPlaceSwaps = [(Int, Int)]()
    sortAndAnimate("Quick Sort in place", &quickSortInPlaceNumbers, &quickSortInPlaceSwaps) { () -> () in
        quickSortInPlace(&quickSortInPlaceNumbers, &quickSortInPlaceSwaps)
    }

    //: Heap Sort
    var heapSortSwaps = [(Int, Int)]()
    sortAndAnimate("Heap Sort", &heapSortNumbers, &heapSortSwaps, { () -> () in
        heapSort(&heapSortNumbers, &heapSortSwaps)
    })
    
    //: Insertion Sort
    var insertionSortSwaps = [(Int, Int)]()
    sortAndAnimate("Insertion Sort", &insertionSortNumbers, &insertionSortSwaps) { () -> () in
        insertionSort(&insertionSortNumbers, &insertionSortSwaps)
    }
}


//: ## Compare Sorting Algorithms
func compare(numbers: [Int]) {
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
    println("Merge Sort:           \(mergeSortRunningTime)")
    println("Quick Sort:           \(quickSortRunningTime)")
    println("Quick Sort In Place:  \(quickSortInPlaceRunningTime)")
    println("Heap Sort:            \(heapSortRunningTime)")
    println("Insertion Sort:       \(insertionSortRunningTime)")
    println()
    
}

let numbers = createRandomNumbersArray(10)
visualCompare(numbers)
compare(numbers)

let moreNumbers = createRandomNumbersArray(100)
compare(moreNumbers)

let evenMoreNumbers = createRandomNumbersArray(1000)
compare(evenMoreNumbers)

