@testable import GameOfThrones
import XCTest


class BeachViewModelTests: XCTestCase {

    class MockHouseService: HouseService {

        var fetchCalledCounter = 0

        override func fetchAll(with complete: @escaping (NetworkService.Result<[House]>) -> Void) {
            fetchCalledCounter += 1
        }
    }

    func testFetchesImagesTillEmptyResults() {
        let service = MockHouseService()

        let houseViewModel = HouseViewModel(houseService: service) { (error) in
            XCTAssertNil(error)
        }

        houseViewModel.fetchHouses()
        XCTAssertEqual(service.fetchCalledCounter, 1)
    }
}
