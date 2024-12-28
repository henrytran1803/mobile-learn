// 1. Custom Exception
class NetworkException(message: String): Exception(message)

// 2. Throwing Exception
fun fetchData(): Data {
    throw NetworkException("No data")
}

// 3. Try-Catch
try {
    val data = fetchData()
} catch (e: NetworkException) {
    println("Network error: ${e.message}")
} finally {
    // Cleanup code
}

// 4. Try as Expression
val result = try {
    fetchData()
} catch (e: Exception) {
    null
}

// 5. Throws Declaration (Optional in Kotlin)
@Throws(IOException::class)
fun readFile() { }