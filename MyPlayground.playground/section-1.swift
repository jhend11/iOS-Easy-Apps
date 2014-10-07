// Playground - noun: a place where people can play

import UIKit


extension UIColor
    {
    class func peachColor() -> UIColor {
        
return UIColor(red: 1.000, green: 0.08, blue: 0.4, alpha: 1.0)
    }
}
var str = "Hello, playground"
UIColor.greenColor()
UIColor.peachColor()


private var kName = "nameKey"


extension UIView {
//    var viewName: String {
//        get {
//            return objc_getAssociatedObject(self, &kName) as String
//        }
//        set {
//            objc_setAssociatedObject(self, &kName, newValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
    var area: CGFloat  {return frame.size.height * frame.size.width}
}

var box = UIView(frame: CGRectMake(0, 0, 25, 40))
box.area

var shape = UIView()
//shape.viewName = "shit"


extension String {
    func broIt() -> String {
        return self + ", Bro!"
    }
    func howManyOfThisLetter(letter: String) -> Int {
        var letterCount = 0
        
        for c in self.startIndex..<self.endIndex {
            
            let range = Range<String.Index>(start: c, end: advance(c, 1))
            
          let  character = self.substringWithRange(range)
            
            if character == letter {
                letterCount++
            }
            
        }
        return letterCount
    }
}


"sup".broIt()
"Four".howManyOfThisLetter("o")
NSStringFromClass(box.dynamicType)
"holy shit batman!".howManyOfThisLetter("a")

var button = UIBarButtonItem()
button.customView?.subviews