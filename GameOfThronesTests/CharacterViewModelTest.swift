@testable import GameOfThrones
import XCTest


class CharacterViewModelTests: XCTestCase {

    class MockCharacterService: CharacterService {

        var fetchCalledCounter = 0

        override func fetchCharacter(by id: String, then complete: @escaping (NetworkService.Result<GameOfThrones.Character>) -> Void) {
            fetchCalledCounter += 1
            XCTAssertEqual(id, "583")
        }
    }

    func testFetchesResults() {
        let service = MockCharacterService()

        _ = CharacterDetailViewModel(characterUrl: "https://anapioficeandfire.com/api/characters/583", characterService: service) { (error) in
            XCTAssertNil(error)
        }

        XCTAssertEqual(service.fetchCalledCounter, 1)
    }
}
