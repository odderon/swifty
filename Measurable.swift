import UIKit

protocol Measurable {

    func __length__() -> Int

}

///Shortcut for val.__length__(), as defined by respective implementation of `Measurable`
func len(val: Measurable) -> Int {
    
    return val.__length__()
    
}

extension String: Measurable {

    func __length__() -> Int {
        
        return characters.count
        
    }

}

extension Character: Measurable {
    
    func __length__() -> Int {
        
        return 1
        
    }
    
}

extension Array: Measurable {
    
    func __length__() -> Int {
        
        return count
        
    }
    
}

extension Dictionary: Measurable {

    func __length__() -> Int {
        
        return count
        
    }

}

extension Int: Measurable {
    
    func __length__() -> Int {
        
        var c = self > 0 ? 0 : 1, n = abs(self)
        while n > 0 {
            
            c += (n & 1)
            n >>= 1
            
        }
        
        return c
        
    }
    
}
