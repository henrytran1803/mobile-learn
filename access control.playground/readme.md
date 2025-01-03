```swift
// Access levels: private, fileprivate, internal, public, open

// 1. Private - chỉ trong cùng file, cùng class/struct
private class BankAccount {
    private var balance: Double
    private func withdraw() {}
}

// 2. Fileprivate - chỉ trong cùng file
fileprivate class Helper {
    fileprivate func helperMethod() {}
}

// 3. Internal (default) - trong cùng module 
class Product {
    var name: String // mặc định internal
}

// 4. Public - module khác có thể access, không override
public class Transaction {
    public var amount: Double
    public func process() {}
}

// 5. Open - cho phép override ở module khác
open class BaseVC {
    open func viewDidLoad() {}
}

// Subclass example
class HomeVC: BaseVC {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
```

Nguyên tắc:
- Private cho implementation details
- Internal cho API trong module  
- Public/Open cho framework API