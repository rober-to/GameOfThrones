@testable import GameOfThrones
import XCTest


class BeachViewModelTests: XCTestCase {

    func testFetchesHouses() {
        let service = HouseService()

        let beachViewModel = HouseViewModel(houseService: service) { (error) in

        }
    }
}
