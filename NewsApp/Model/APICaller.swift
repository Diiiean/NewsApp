import Foundation
final class APICaller {
    static let shared = APICaller()
    struct Constants {
    static let topHeadlinesURL = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2021-09-24&to=2021-09-24&sortBy=popularity&apiKey=19089fc464504ac09fb832ae8d3958d5")
    static let searchUrlString = "https://newsapi.org/v2/everything?sortBy=popularity&apiKey=19089fc464504ac09fb832ae8d3958d5&q="
    }
    private init() {}
    
    public func getLatestStories(completion: @escaping(Result<[Article], Error>) -> Void) {
        guard let url = Constants.topHeadlinesURL else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    print("Articles:\(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    public func search(with query: String, completion: @escaping(Result<[Article], Error>) -> Void) {
    guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
        return
    }
    let urlString = Constants.searchUrlString + query
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}
// Models
struct APIResponse: Codable {
    let articles: [Article]
}
struct Article: Codable {
    let source: Source
    let title: String
    let description: String?
    let url: String?
    let publishedAt: String
    let urlToImage: String?
}
struct Source: Codable {
    let name: String
}
