import UIKit

class HouseViewModel {

    typealias FetchCompletion = (Error?) -> Void

    private var houseService: HouseService
    private var houses = [House]()
    private var isLoading = false
    private var fetchCompletion: FetchCompletion!
    var housesCount: Int { return houses.count }

    init(houseService: HouseService, fetchCompletion: @escaping FetchCompletion) {
        self.houseService = houseService
        self.fetchCompletion = fetchCompletion
    }

    func house(at index: Int) -> House { return houses[index] }

    func fetchHousees() {
        guard !isLoading else { return }

        isLoading = true

        houseService.fetchAll { (result) in

            self.isLoading = false

            switch result {
            case .failure(let error):
                self.fetchCompletion(error)
            case .success(let houses):
                self.houses = houses
                DispatchQueue.main.async { self.fetchCompletion(nil) }
            }
        }
    }
}
