import UIKit

// custom error
enum CustomError: Error {
    case invalidUrl
    case orther
    case urlEmpty
}

func validateUrl (url: String) -> Bool{
    guard !url.isEmpty else {
        return false
    }
    return true
}
func validateUrlHanding (url: String) throws -> Bool{
    guard !url.isEmpty else {
        throw CustomError.invalidUrl
    }
    return true
}
func checkValid(){
    let url = "a"
    do{
        var result = try? validateUrlHanding(url: url)
        
    }catch
    {
        print(error)
    }
}
checkValid()
// 1. Error Protocol
enum NetworkError: Error {
    case badURL
    case noData
}

// 2. Throwing Function
func fetchData() throws -> Data {
    throw NetworkError.noData
}

// 3. Do-Catch
do {
    let data = try fetchData()
} catch NetworkError.noData {
    print("No data received")
} catch {
    print("Other error: \(error)")
}

// 4. Try variants
let data1 = try? fetchData() // Returns optional
let data2 = try! fetchData() // Forces unwrap, can crash

// 5. Defer
func processFile() {
    let file = openFile()
    defer { file.close() }
    // Process file...
}
