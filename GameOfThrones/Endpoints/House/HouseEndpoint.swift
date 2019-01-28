import Foundation

enum HouseEndpoint {
    case all()
}

extension HouseEndpoint: Endpoint {

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
        return "houses"
    }
}

