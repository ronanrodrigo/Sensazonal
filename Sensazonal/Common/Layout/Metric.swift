import CoreGraphics

struct Metric {
    private static let multiplier: CGFloat = 4
    /// Size: 4
    static let extraSmall = multiplier
    /// Size: 8
    static let small = multiplier * 2
    /// Size: 12
    static let medium = multiplier * 3
    /// Size: 16
    static let large = multiplier * 4
    /// Size: 20
    static let extraLarge = multiplier * 5
    /// Size: 24
    static let doubleExtraLarge = multiplier * 6
}
