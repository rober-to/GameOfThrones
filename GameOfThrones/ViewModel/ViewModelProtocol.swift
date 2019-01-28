import Foundation

protocol ViewModel: AnyObject {
    var sections: [Section] { get set }
    var numberOfSections: Int { get }
    func numberOfCellForSection(_ section: Int) -> Int
    func cell(at indexPath: IndexPath) -> Cell
    func title(for section: Int) -> String?
    func createListSection(named: String, list: [String])
    func addBasicCells(to cells: inout [Cell], title: String, text: String, segue: String?)
}

extension ViewModel {
    var numberOfSections: Int {
        return sections.count
    }

    func numberOfCellForSection(_ section: Int) -> Int {
        return sections[section].cells.count
    }

    func cell(at indexPath: IndexPath) -> Cell {
        return sections[indexPath.section].cells[indexPath.row]
    }

    func title(for section: Int) -> String? {
        let section = sections[section]
        guard !section.cells.isEmpty else { return nil }
        return section.title
    }

    func createListSection(named: String, list: [String]) {
        var cells = [Cell]()

        for text in list {
            guard !text.isEmpty else { continue }
            let cell = Cell(storyboardId: "ListCell", title: text)
            cells.append(cell)
        }

        guard !cells.isEmpty else { return }
        sections.append(Section(title: named, cells: cells))
    }

    func addBasicCells(to cells: inout [Cell], title: String, text: String, segue: String? = nil) {
        if !text.isEmpty {
            let cell = Cell(storyboardId: "BasicCell", title: title, value: text, segueIdentifier: segue)
            cells.append(cell)
        }
    }
}
