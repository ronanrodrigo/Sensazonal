import Foundation

struct Locale {
    private static let fileName = "Locale"

    static func localize(_ key: String) -> String {
        return NSLocalizedString(key, tableName: fileName, comment: "Shu 2")
    }
}
