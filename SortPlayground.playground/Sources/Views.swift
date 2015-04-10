import UIKit
import XCPlayground

public func setupViews(numbers: [Int]) -> (UIView, [UIView]) {
    
    let view = UIView(frame: CGRectMake(0, 0, 600, 200))
    
    let maxSize = numbers.reduce(Int.min, combine: max)
    let minHeight: CGFloat = CGFloat(200 / maxSize)
    let width = 500 / numbers.count
    
    var views: [UIView] = [UIView]()
    for i in 0..<numbers.count {
        let height: CGFloat = CGFloat(numbers[i]) * minHeight
        let x: CGFloat = CGFloat((width + 2) * i)
        let subview = UIView(frame: CGRectMake(x, 200 - height, CGFloat(width), height))
        subview.backgroundColor = UIColor.grayColor()
        view.addSubview(subview)
        views.append(subview)
    }
    
    return (view , views)
}

func animateSwap(fromView: UIView, toView: UIView, completed: () -> ()) {
    let fromPosition = fromView.frame.origin
    let toPosition = toView.frame.origin
    UIView.animateWithDuration(0.5, animations: { () -> Void in
            fromView.frame.origin.x = toPosition.x
            toView.frame.origin.x = fromPosition.x
        }) { (isFinished) -> Void in
            completed()
    }
}

func animate(inout swaps: [(Int, Int)], inout views: [UIView]) {
    if let s = swaps.first {
        animateSwap(views[s.0], views[s.1]) { (complete) -> () in
            swap(&views[s.0], &views[s.1])
            swaps.removeAtIndex(0)
            animate(&swaps, &views)
        }
    }
}


public func sortAndAnimate(functionName: String, inout data: [Int], inout swaps: [(Int, Int)], sortFunction: () -> ()) {
    var views: (UIView, [UIView]) = setupViews(data)
    XCPShowView(functionName, views.0)
    
    sortFunction()
    
    animate(&swaps, &views.1)
}