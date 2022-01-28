import Core

public protocol SessionManager: Startable {
    var session: Int { get }
}
