import Foundation

public struct ContentResponse: Codable {
    public let id: String
    public let type: ContentType
    public let attributes: Attributes
    public let relationships: Relationships
    public let links: Links

    public enum ContentType: String, Codable {
        case contents
    }

    public struct Attributes: Codable {
        public let uri: URL
        public let name: String
        public let description: String
        public let releasedAt: Date
        public let free: Bool
        public let difficulty: Difficulty?
        public let contentType: ContentType
        public let duration: TimeInterval
        public let popularity: Float
        public let technologyTripleString: String
        public let contributorString: String
        public let ordinal: Int?
        public let professional: Bool
        public let descriptionPlainText: String
        public let videoIdentifier: String?
        public let parentName: String?
        public let cardArtworkUrl: URL

        public enum ContentType: String, Codable {
            case collection
            case article
        }
    }

    public enum Difficulty: String, Codable {
        case beginner
        case intermediate
        case advanced
    }

    public struct Relationships: Codable {
        public let domains: DataContainer<[DataModel]>?
        public let childContents: ChildContents
        public let progression: DataContainer<DataModel?>
        public let bookmark: DataContainer<DataModel?>

        public struct ChildContents: Codable {
            public let meta: Meta

            public struct Meta: Codable {
                public let count: Int
            }
        }

        public struct DataModel: Codable {
            public let id: String
            public let type: DataType

            public enum DataType: String, Codable {
                case domains
                case progressions
            }
        }
    }

    public struct Links: Codable {
        public let `self`: URL
    }
}

public struct DataContainer<T: Codable>: Codable {
    public let data: T
}
