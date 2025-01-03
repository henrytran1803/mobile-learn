# Tài liệu về ARC (Automatic Reference Counting) trong Swift

## ARC là gì?
ARC tự động quản lý bộ nhớ bằng cách đếm số tham chiếu đến instance của class. Khi không còn tham chiếu nào, instance sẽ được giải phóng.

## Cách ARC hoạt động
1. **Strong Reference** (mặc định):
- Mỗi tham chiếu đến instance sẽ tăng reference count
- Instance chỉ bị giải phóng khi count = 0
```swift
var ref1, ref2, ref3: Person?
ref1 = Person(name: "John")  // count = 1
ref2 = ref1                  // count = 2
ref3 = ref1                  // count = 3
ref1 = nil                   // count = 2
ref2 = nil                   // count = 1
ref3 = nil                   // count = 0, giải phóng
```

2. **Strong Reference Cycle**:
- Xảy ra khi 2 instance tham chiếu qua lại
- Không thể giải phóng dù gán nil
- Gây memory leak

3. **Weak Reference**:
- Dùng từ khóa `weak`
- Không tăng reference count
- Tự động nil khi instance bị giải phóng
- Giải quyết strong reference cycle

4. **Unowned Reference**:
- Dùng từ khóa `unowned` 
- Không tăng reference count
- Giả định instance luôn tồn tại
- Dùng khi biết chắc instance không nil

## Ví dụ thực tế:
```swift
class Student {
    let name: String
    weak var classroom: Classroom?    // Weak để tránh cycle
    
    init(name: String) {
        self.name = name
        print("\(name) khởi tạo")
    }
    
    deinit {
        print("\(name) giải phóng")
    }
}

class Classroom {
    let name: String
    var students: [Student] = []     // Strong reference
    
    init(name: String) {
        self.name = name
    }
}
```

## Unowned Reference trong ARC

```swift
class Customer {
    let name: String
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit { 
        print("\(name) đã giải phóng")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer // Unowned vì thẻ luôn thuộc về khách hàng
    
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("Thẻ #\(number) đã giải phóng") 
    }
}
```

### So sánh các kiểu tham chiếu:

1. **Strong Reference**:
- Mặc định
- Giữ instance tồn tại
- Tăng reference count

2. **Weak Reference**: 
- Optional value
- Có thể nil
- Không tăng count
- Dùng khi reference có thể nil

3. **Unowned Reference**:
- Non-optional value  
- Không tăng count
- Giả định luôn tồn tại
- Dùng khi reference không bao giờ nil

### Khi nào dùng:

- **Weak**: Parent-Child khi child có thể tồn tại độc lập
- **Unowned**: Parent-Child khi child luôn phụ thuộc parent
- **Strong**: Các trường hợp còn lại

### Lưu ý:
- Cẩn thận với strong reference cycle
- Dùng weak/unowned cho relationship ngược
- Track lifecycle với init/deinit
- Test kỹ memory management


syntax reference closure

lazy var someClosure = {
        [unowned self, weak delegate = self.delegate] in
    // closure body goes here
}