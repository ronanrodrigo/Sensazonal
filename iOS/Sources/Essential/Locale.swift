import Foundation

func localize(_ key: String) -> String {
    let fileName = "Locale"
    return NSLocalizedString(key, tableName: fileName, comment: "")
}

func localize(_ key: String, with args: CVarArg...) -> String {
    let localiedString = localize(key)
    return String(format: localiedString, locale: .current, arguments: args)
}
