import Foundation

class HouseService: NetworkService {

    func fetchAll(with complete: @escaping (Result<[House]>) -> Void) {
        request(HouseEndpoint.all()) { result in
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode([House].self, from: data)
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
