import UIKit

class HousesViewController: GameOfThronesTableViewController {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewModel = HouseViewModel(houseService: HouseService(), fetchCompletion: { [unowned self] (error) in
            self.tableView.refreshControl?.endRefreshing()
            guard error == nil else { return self.showErrorAlert(error: error!) }
            self.tableView.reloadData()
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView(frame: .zero)
    }

    override func reloadData(refreshControl: UIRefreshControl) {
        (viewModel as? HouseViewModel)?.fetchHouses()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        let house = (viewModel as! HouseViewModel).house(at: selectedIndexPath.row)
        let destination = segue.destination as! HouseDetailViewController
        destination.house = house
    }
}
