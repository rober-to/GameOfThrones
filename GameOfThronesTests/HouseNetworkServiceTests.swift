@testable import GameOfThrones
import XCTest

class HouseNetworkServiceTests: XCTestCase {

    func testFetchBeaches() {
        let engine = URLSession.shared
        let service = HouseService(engine: engine)
        let expectation = self.expectation(description: #function)

        service.fetchAll() { result in
            switch result {
            case .success(let houses):
                XCTAssertNotNil(houses)
                XCTAssertFalse(houses.isEmpty)
                expectation.fulfill()
            case .failure(let error):
                print(error)
                XCTFail(String(describing: error))
            }
        }
        waitForExpectations(timeout: 5)
    }
}
