import UIKit

class CharacterTableViewController: GameOfThronesTableViewController {

    var characterUrl: String? {
        didSet {
            self.tableView.refreshControl?.endRefreshing()
            guard let characterUrl = characterUrl else { return }
            viewModel = CharacterDetailViewModel(characterUrl: characterUrl, characterService: CharacterService()) { [weak self] error in
                guard error == nil else {
                    self?.showErrorAlert(error: error!)
                    return
                }
                self?.tableView.reloadData()
            }
        }
    }

    override func reloadData(refreshControl: UIRefreshControl) {
        (viewModel as? CharacterDetailViewModel)?.fetchCharacter(by: characterUrl!)
    }
}
