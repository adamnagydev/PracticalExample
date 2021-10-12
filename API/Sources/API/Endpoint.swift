import Foundation

/// Fetchable files on github.
public enum Endpoint: String {
    case articles
    case videos

    public var url: URL {
        URL(string: "https://raw.githubusercontent.com/raywenderlich/ios-interview/master/Practical%20Example/\(rawValue).json")!
    }
}
