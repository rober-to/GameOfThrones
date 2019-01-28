import Foundation

struct Character: Decodable {
    let name: String
    let gender: String
    let culture: String
    let born: String
    let died: String
    let titles: [String]
    let aliases: [String]
    let tvSeries: [String]
    let playedBy: [String]
}
