import Foundation

extension JSONDecoder {

    /// RW API JSON decoder.
    static let api: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .rw
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
}

private extension JSONDecoder.DateDecodingStrategy {

    /// Custom RW date decoding strategy.
    static var rw: JSONDecoder.DateDecodingStrategy {
        self.formatted(.rw)
    }
}

private extension DateFormatter {

    /// RW date formatter.
    /// Format: "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    static let rw: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return formatter
    }()
}
