import Foundation

struct House: Decodable {
    private(set) var url: String
    private(set) var name: String
    private(set) var region: String
    private(set) var coatOfArms: String
    private(set) var words: String
    private(set) var titles: [String]
    private(set) var seats: [String]
    private(set) var currentLord: String
    private(set) var heir: String
    private(set) var overlord: String
    private(set) var founded: String
    private(set) var founder: String
    private(set) var diedOut: String
    private(set) var ancestralWeapons: [String]
    private(set) var cadetBranches: [String]
}
