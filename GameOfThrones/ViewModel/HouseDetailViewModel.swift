import Foundation

class HouseDetailViewModel {

    private var sections = [Section]()
    var numberOfSections: Int {
        return sections.count
    }

    init(house: House) {
        // Didn't use a instance variable House to reduce state
        // There is only one point of truth for House
        createHeader(house: house)
        createBasicSection(house: house)
        createTitlesSection(house: house)
        createSeatsSection(house: house)
        createAncestralWeaponsSection(house: house)
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

    private func createHeader(house: House) {
        guard !house.words.isEmpty else { return }
        let wordsCell = Cell(storyboardId: "HeaderCell", title: house.words)
        sections.append(Section(title: nil, cells: [wordsCell]))
    }

    private func createBasicSection(house: House) {
        var cells = [Cell]()

        addBasicCells(to: &cells, title: "Coat of arms", text: house.coatOfArms)
        addBasicCells(to: &cells, title: "Region", text: house.region)
        addBasicCells(to: &cells, title: "Founded in", text: house.founded)
        addBasicCells(to: &cells, title: "Died out", text: house.diedOut)


        guard !cells.isEmpty else { return }
        sections.append(Section(title: "Basic info", cells: cells))
    }

    private func createTitlesSection(house: House) {
        createListSection(named: "Titles", list: house.titles)
    }

    private func createSeatsSection(house: House) {
        createListSection(named: "Seats", list: house.seats)
    }

    private func createAncestralWeaponsSection(house: House) {
        createListSection(named: "Ancestral weapons", list: house.ancestralWeapons)
    }

    private func addBasicCells(to cells: inout [Cell], title: String, text: String) {
        if !text.isEmpty {
            let regionCell = Cell(storyboardId: "BasicCell", title: title, value: text)
            cells.append(regionCell)
        }
    }

    private func createListSection(named: String, list: [String]) {
        var cells = [Cell]()

        for text in list {
            guard !text.isEmpty else { continue }
            let cell = Cell(storyboardId: "ListCell", title: text)
            cells.append(cell)
        }

        guard !cells.isEmpty else { return }
        sections.append(Section(title: named, cells: cells))
    }

}
