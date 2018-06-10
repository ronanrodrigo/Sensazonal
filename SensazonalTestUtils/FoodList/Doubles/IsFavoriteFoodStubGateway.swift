@testable import Sensazonal

public class IsFavoriteFoodStubGateway: IsFavoriteFoodGateway {

    public var didCallValidate = false
    public var validateStub = false

    public init() { }

    public func validate(by keyName: String) -> Bool {
        didCallValidate = true
        return validateStub
    }
}
