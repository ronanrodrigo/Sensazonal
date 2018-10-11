@testable import Sensazonal

extension Food.Key {

    public static func == (lhs: Food.Key?, rhs: Food.Key) -> Bool {
        guard let lhs = lhs else { return false }
        return lhs == rhs
    }

}
