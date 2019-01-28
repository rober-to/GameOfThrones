import UIKit

class HouseDetailViewController: GameOfThronesTableViewController {

    var house: House? {
        didSet {
            guard let house = house else { return }
            self.viewModel = HouseDetailViewModel(house: house)
            self.title = house.name.replacingOccurrences(of: "House", with: "").trimmingCharacters(in: .whitespacesAndNewlines)
            self.tableView.reloadData()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = tableView.indexPathForSelectedRow!
        let cellModel = viewModel!.cell(at: indexPath)
        let destination = segue.destination as! CharacterTableViewController
        destination.characterUrl = cellModel.value == nil ? cellModel.title : cellModel.value
    }
}

