import UIKit

typealias FetchCompletion = (Error?) -> Void

class HouseViewModel: ViewModel {
    var sections = [Section]()

    private var houseService: HouseService
    private var houses = [House]()
    private var isLoading = false
    private var fetchCompletion: FetchCompletion!
    var housesCount: Int { return houses.count }

    init(houseService: HouseService, fetchCompletion: @escaping FetchCompletion) {
        self.houseService = houseService
        self.fetchCompletion = fetchCompletion
        fetchHouses()
    }

    func fetchHouses() {
        guard !isLoading else { return }

        isLoading = true

        houseService.fetchAll { (result) in

            self.isLoading = false

            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self.fetchCompletion(error)
                case .success(let houses):
                    self.houses = houses
                    self.createList(of: houses)
                    self.fetchCompletion(nil)
                }
            }
        }
    }

    func house(at index: Int) -> House { return houses[index] }

    private func createList(of houses: [House]) {
        var cells = [Cell]()
        for house in houses {
            addBasicCells(to: &cells, title: house.name, text: house.region, segue: "HouseDetailSegue")
        }
        guard !cells.isEmpty else { return }
        sections.append(Section(title: nil, cells: cells))
    }
}
