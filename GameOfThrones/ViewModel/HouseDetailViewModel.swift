import Foundation

class HouseDetailViewModel: ViewModel {
    var sections = [Section]()

    init(house: House) {
        // Didn't use a instance variable House to reduce state
        createHeader(house: house)
        createBasicSection(house: house)
        createTitlesSection(house: house)
        createSeatsSection(house: house)
        createAncestralWeaponsSection(house: house)
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
        addBasicCells(to: &cells, title: "Lord", text: house.currentLord, segue: "CharacterSegue")

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
}
