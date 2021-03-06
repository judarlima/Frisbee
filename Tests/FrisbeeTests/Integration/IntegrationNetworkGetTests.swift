import XCTest
@testable import Frisbee

final class IntegrationNetworkGetTests: XCTestCase {

    struct Movie: Decodable {
        let name: String
    }

    func testGetWhenHasValidURLWithValidEntityThenRequestAndTransformData() {
        let url = "https://gist.githubusercontent.com/ronanrodrigo" +
                  "/fbb32cee20e43f0f9972c9a3230ef93d/raw/2cb87fd40e65fadb25fcc30f643d385bccdb5f7c/movie.json"
        let longRunningExpectation = expectation(description: "RequestMoviesWithSuccess")
        let expectedMovieName = "Ghostbusters"
        var returnedData: Movie?

        NetworkGetter().get(url: url) { (result: Result<Movie>) in
            returnedData = result.data
            longRunningExpectation.fulfill()
        }

        waitForExpectations(timeout: 20) { expectationError in
            XCTAssertNil(expectationError, expectationError!.localizedDescription)
            XCTAssertEqual(returnedData?.name, expectedMovieName)
        }
    }

}
