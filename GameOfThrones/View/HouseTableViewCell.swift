import UIKit

class HouseTableViewCell: UITableViewCell {

    func update(with house: House) {
        self.textLabel?.text = house.name
        self.detailTextLabel?.text = house.region
    }
}
