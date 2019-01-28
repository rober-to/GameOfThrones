import Foundation

enum CharacterEndpoint {
    case character(id: String)
}

extension CharacterEndpoint: Endpoint {

    var basePath: String {
        return "https://anapioficeandfire.com/api"
    }

    var headers: Headers {
        return ["Content-Type": "application/json"]
    }

    var method: Method {
        return .get
    }

    var path: String {
        switch self {
        case .character(let id):
            return "characters/\(id)"
        }
    }
}

