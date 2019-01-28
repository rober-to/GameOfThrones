import UIKit

class GameOfThronesTableViewController: UITableViewController {

    final var viewModel: ViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)

        tableView.refreshControl = refreshControl
    }

    @objc func reloadData(refreshControl: UIRefreshControl) { }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.numberOfSections ?? 0
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel?.title(for: section)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfCellForSection(section) ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = viewModel!.cell(at: indexPath)
        let cellView = tableView.dequeueReusableCell(withIdentifier: cellModel.storyboardId, for: indexPath) as! HouseTableViewCell
        cellView.update(with: cellModel)
        return cellView
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellModel = viewModel!.cell(at: indexPath)
        guard let segueIdentifier = cellModel.segueIdentifier else { return }
        self.performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
}
