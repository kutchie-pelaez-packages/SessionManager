import Core

public protocol SessionManager {
    var sessionValueSubject: ValueSubject<Int> { get }
}

extension SessionManager {
    public var session: Int { sessionValueSubject.value }
}
