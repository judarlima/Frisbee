import XCTest
@testable import Frisbee

final class NetworkGetterTests: XCTestCase {

    private let invalidUrl = "🤷‍♂️"
    private let validUrl = "http://www.com.br"

    func testGetWhenURLStringIsInvalidFormatThenExecuteCompletionHandlerWithInvalidURLError() {
        var generatedResult: Result<Data?>!

        NetworkGetter().get(url: invalidUrl) { generatedResult = $0 }

        XCTAssertEqual(generatedResult, Result.fail(FrisbeeError.invalidUrl))
    }

    static var allTests = [
        ("testGetWhenURLStringIsInvalidFormatThenExecuteCompletionHandlerWithInvalidURLError",
         testGetWhenURLStringIsInvalidFormatThenExecuteCompletionHandlerWithInvalidURLError)
    ]

}
