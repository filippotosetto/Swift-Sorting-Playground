//
//  Utility.swift
//  
//
//  Created by Filippo Tosetto on 25/03/2015.
//
//

import Foundation

let NANOS_PER_SEC:Double = 1000 * 1000 * 1000

// Ref: http://stackoverflow.com/questions/24101718/swift-performance-sorting-arrays
public class TimePerformer {

    var timeStart:UInt64 = 0
    
    public init() {}
    
    public func run(sortingFunction: ()->()) -> Double {
        timeStart = mach_absolute_time()
        
        sortingFunction()
        
        var timebase_info:mach_timebase_info_data_t = mach_timebase_info_data_t(numer: 0, denom: 0)
        return abs_to_seconds(mach_absolute_time() - timeStart, timebase_info: &timebase_info)
    }
    
    private func abs_to_nanos(abs: UInt64, inout timebase_info:mach_timebase_info_data_t) -> Double {
        if (timebase_info.denom == 0 ) {
            mach_timebase_info(&timebase_info)
        }
        return (Double)(abs * (UInt64)(timebase_info.numer  / timebase_info.denom));
    }
    
    private func abs_to_seconds(abs: UInt64, inout timebase_info:mach_timebase_info_data_t) -> Double {
        return abs_to_nanos(abs, timebase_info: &timebase_info) /  NANOS_PER_SEC;
    }
}



public func createRandomNumbersArray(size: UInt32) -> [Int]{
    var numbers = [Int]()
    for i in 1...size {
        let n = Int(arc4random() % size)
        numbers.append(n)
    }
    
    return numbers
}

