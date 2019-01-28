import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var valueLabel: UILabel?

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel?.text = ""
        valueLabel?.text = ""
    }

    func update(with cell: Cell) {
        titleLabel?.text = cell.title
        valueLabel?.text = cell.value
    }
}
