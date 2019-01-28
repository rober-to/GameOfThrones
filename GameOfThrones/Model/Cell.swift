import Foundation

struct Section {
    private(set) var title: String?
    private(set) var cells: [Cell]

    init(title: String?, cells: [Cell]) {
        self.title = title
        self.cells = cells
    }
}

struct Cell {
    private(set) var storyboardId: String
    private(set) var title: String?
    private(set) var value: String?
    private(set) var segueIdentifier: String?

    init(storyboardId: String, title: String? = nil, value: String? = nil, segueIdentifier: String? = nil) {
        self.storyboardId = storyboardId
        self.title = title
        self.value = value
        self.segueIdentifier = segueIdentifier
    }
}
