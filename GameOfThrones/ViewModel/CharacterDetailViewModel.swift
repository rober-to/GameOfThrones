import Foundation

class CharacterDetailViewModel: ViewModel {
    var sections = [Section]()
    private var fetchCompletion: FetchCompletion!
    private var characterService: CharacterService!

    init(characterUrl: String, characterService: CharacterService, completion: @escaping FetchCompletion) {
        self.fetchCompletion = completion
        self.characterService = characterService

        if let id = characterUrl.split(separator: "/").last {
            fetchCharacter(by: String(id))
        }
    }

    func fetchCharacter(by id: String) {
        characterService.fetchCharacter(by: id) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let character):
                    self.createForm(character: character)
                    self.fetchCompletion(nil)
                case .failure(let error):
                    self.fetchCompletion(error)
                }
            }
        }
    }

    private func createForm(character: Character) {
        createBasicSection(character: character)
        createTitlesSection(character: character)
        createAliasesSection(character: character)
        createSeriesSection(character: character)
        createActorSection(character: character)
    }

    private func createBasicSection(character: Character) {
        var cells = [Cell]()

        addBasicCells(to: &cells, title: "Name", text: character.name)
        addBasicCells(to: &cells, title: "Gender", text: character.gender)
        addBasicCells(to: &cells, title: "Culture", text: character.culture)
        addBasicCells(to: &cells, title: "Born", text: character.born)
        addBasicCells(to: &cells, title: "Died", text: character.died)

        guard !cells.isEmpty else { return }
        sections.append(Section(title: "Basic info", cells: cells))
    }

    private func createTitlesSection(character: Character) {
        createListSection(named: "Titles", list: character.titles)
    }

    private func createAliasesSection(character: Character) {
        createListSection(named: "Aliases", list: character.aliases)
    }

    private func createSeriesSection(character: Character) {
        createListSection(named: "Series", list: character.tvSeries)
    }

    private func createActorSection(character: Character) {
        createListSection(named: "Played by", list: character.playedBy)
    }
}
