import UIKit

extension Array {

    ///Remove & return `element` if it exists in the receiver.
    mutating func discardElement <DiscardQualifier where DiscardQualifier: Equatable> (element: DiscardQualifier) -> Element? {
        
        for tuple in enumerate() {
        
            if tuple.element as? DiscardQualifier == element {
            
                return removeAtIndex(tuple.index)
            
            }
        
        }
        
        return nil
    
    }
    
    ///Remove & return first element in receiver satisfying `predicate`.
    mutating func discardFirstWhere(predicate: Element -> Bool) -> Element? {
    
        for tuple in enumerate() {
        
            if predicate(tuple.element) {
            
                return removeAtIndex(tuple.index)
            
            }
        
        }
        
        return nil
        
    }
    
    ///Boolean value indicating whether `index` is valid.
    @warn_unused_result func validIndex(index: Index) -> Bool {
    
        return index >= 0 && index < count
    
    }
    
    ///Shuffles the receiver's elements.
    mutating func shuffleInPlace() {
    
        if count > 1 {
        
            for i in 0..<count {
            
                let j = Index(arc4random_uniform(UInt32(count)))
                
                if i != j && validIndex(j) {
                
                    swap(&self[i], &self[j])
                
                }
            
            }
        
        }
    
    }
    
    ///Returns a shuffled copy of the receiver.
    @warn_unused_result func shuffled() -> [Element] {
    
        var arr = self
        arr.shuffleInPlace()
        return arr
    
    }

}

///Append element `rhs` to array `lhs`. Elemental types must match.
func + <Element: Any> (lhs: Array<Element>, rhs: Element) -> Array<Element> {

    var arr = lhs
    arr.append(rhs)
    return arr

}

///Append contents of `rhs` to array `lhs`. Elemental types must match.
func + <Element: Any> (lhs: Array<Element>, rhs: Array<Element>) -> Array<Element> {

    var arr = lhs
    arr.appendContentsOf(rhs)
    return arr

}

