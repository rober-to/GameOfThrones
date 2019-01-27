import Foundation

protocol NetworkEngine {
    typealias Handler = (Data?, URLResponse?, Error?) -> Void

    func performRequest(for urlRequest: URLRequest, completionHandler: @escaping Handler)
}

extension URLSession: NetworkEngine {
    typealias Handler = NetworkEngine.Handler

    func performRequest(for urlRequest: URLRequest, completionHandler: @escaping Handler) {
        let task = dataTask(with: urlRequest, completionHandler: completionHandler)
        task.resume()
    }
}

