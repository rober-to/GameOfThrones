import Foundation

class CharacterService: NetworkService {

    func fetchCharacter(by id: String, then complete: @escaping (Result<Character>) -> Void) {
        request(CharacterEndpoint.character(id: id)) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(Character.self, from: data)
                    complete(.success(decodedData))
                } catch {
                    complete(.failure(error))
                }
            case .failure(let error):
                complete(.failure(error))
            }
        }
    }
}
