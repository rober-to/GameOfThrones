@testable import GameOfThrones
import XCTest

class CharacterNetworkServiceTests: XCTestCase {

    func testFetchCharacter() {
        let engine = URLSession.shared
        let service = CharacterService(engine: engine)
        let expectation = self.expectation(description: #function)

        service.fetchCharacter(by: "583") { result in
            switch result {
            case .success(let character):
                XCTAssertNotNil(character)
                XCTAssertEqual(character.name, "Jon Snow")
                expectation.fulfill()
            case .failure(let error):
                print(error)
                XCTFail(String(describing: error))
            }
        }
        waitForExpectations(timeout: 5)
    }
}
