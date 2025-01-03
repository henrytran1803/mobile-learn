import UIKit

//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//        print("\(name) is being initialized")
//    }
//    deinit {
//        print("\(name) is being deinitialized")
//    }
//}
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//reference1 = Person(name: "John Appleseed")
//reference2 = reference1
//reference3 = reference1
//reference1 = nil
//reference2 = nil
//reference3 = nil

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}


class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person?
var unit4A: Apartment?
john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")
john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil

//Bài tập: Tạo một ứng dụng quản lý thư viện đơn giản với các yêu cầu sau:
//
//Tạo class Book và Library
//Book cần có: tên, tác giả, ID, trạng thái mượn
//Library quản lý danh sách books và người mượn
//Xử lý memory management đúng cách với ARC
//Thêm weak reference khi cần thiết để tránh memory leak
class Book {
    let id: UUID
    let name: String
    let author: String
    var status: Bool
    weak var borrower: Borrower?
    
    init(id: UUID, name: String, author: String, status: Bool) {
        self.id = id
        self.name = name
        self.author = author
        self.status = status
        print("Book \(name) được khởi tạo")
    }
    
    deinit {
        print("Book \(name) đã giải phóng")
    }
}

class Borrower {
    let id: UUID
    let name: String
    var books: [Book]
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
        self.books = []
        print("Borrower \(name) được khởi tạo")
    }
    
    deinit {
        print("Borrower \(name) đã giải phóng")
    }
}

class LibManager {
    var books: [Book] = []
    var borrowers: [Borrower] = []
    
    func addBook(_ book: Book) {
        books.append(book)
    }
    
    func addBorrower(_ borrower: Borrower) {
        borrowers.append(borrower)
    }
    
    func lendBook(bookId: UUID, borrowerId: UUID) -> Bool {
        guard let book = books.first(where: { $0.id == bookId }),
              let borrower = borrowers.first(where: { $0.id == borrowerId }) else {
            return false
        }
        
        if !book.status {
            book.status = true
            book.borrower = borrower
            borrower.books.append(book)
            return true
        }
        return false
    }
}

func main() {
    let lib = LibManager()
    
    // Tạo sách và người mượn
    var book1 = Book(id: UUID(), name: "Swift Programming", author: "Apple", status: false)
    var book2 = Book(id: UUID(), name: "iOS Development", author: "Apple", status: false)
    
    var borrower1 = Borrower(id: UUID(), name: "John")
    var borrower2 = Borrower(id: UUID(), name: "Mary")
    
    // Thêm vào thư viện
    lib.addBook(book1)
    lib.addBook(book2)
    lib.addBorrower(borrower1)
    lib.addBorrower(borrower2)
    
    // Mượn sách
    if lib.lendBook(bookId: book1.id, borrowerId: borrower1.id) {
        print("\(borrower1.name) đã mượn sách \(book1.name)")
    }
    
    // Test memory management
    book1 = Book(id: UUID(), name: "New Book", author: "Test", status: false)
    borrower1 = Borrower(id: UUID(), name: "New Borrower")
}

//main()
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
var johnn: Customer?
johnn = Customer(name: "John Appleseed")
johnn!.card = CreditCard(number: 1234_5678_9012_3456, customer: johnn!)
johnn = nil
class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
}


class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
}
var department = Department(name: "Horticulture")


let intro = Course(name: "Survey of Plants", in: department)
let intermediate = Course(name: "Growing Common Herbs", in: department)
let advanced = Course(name: "Caring for Tropical Plants", in: department)


intro.nextCourse = intermediate
intermediate.nextCourse = advanced
department.courses = [intro, intermediate, advanced]
