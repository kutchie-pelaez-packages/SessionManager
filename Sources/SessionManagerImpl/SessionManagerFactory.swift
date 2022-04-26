import SessionManager

public struct SessionManagerFactory {
    public init() { }

    public func produce() -> SessionManager {
        SessionManagerImpl()
    }
}
