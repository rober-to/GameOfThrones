import UIKit

class HousesViewController: UITableViewController {

    private var houseViewModel: HouseViewModel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.houseViewModel = HouseViewModel(houseService: HouseService(), fetchCompletion: { [unowned self] (error) in
            self.tableView.reloadData()
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView(frame: .zero)
        houseViewModel.fetchHouses()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndexPath = tableView.indexPathForSelectedRow!
        let house = houseViewModel.house(at: selectedIndexPath.row)
        let destination = segue.destination as! HouseDetailViewController
        destination.house = house
    }
}

extension HousesViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houseViewModel.housesCount
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HouseCell", for: indexPath) as! HouseTableViewCell
        cell.update(with: houseViewModel.house(at: indexPath.row))
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "HouseDetailSegue", sender: nil)
    }
}
