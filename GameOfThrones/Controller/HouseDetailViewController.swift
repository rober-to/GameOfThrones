import UIKit

class HouseDetailViewController: UITableViewController {

    var house: House? {
        didSet {
            guard let house = house else { return }
            self.houseDetailViewModel = HouseDetailViewModel(house: house)
            self.title = house.name.replacingOccurrences(of: "House", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    private var houseDetailViewModel: HouseDetailViewModel?


}

extension HouseDetailViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return houseDetailViewModel?.numberOfSections ?? 0
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return houseDetailViewModel?.title(for: section)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houseDetailViewModel?.numberOfCellForSection(section) ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = houseDetailViewModel!.cell(at: indexPath)
        let cellView = tableView.dequeueReusableCell(withIdentifier: cellModel.storyboardId, for: indexPath) as! DetailTableViewCell
        cellView.update(with: cellModel)
        return cellView
    }
}
