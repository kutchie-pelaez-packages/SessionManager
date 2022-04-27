import SessionManager
import Tweak

public struct SessionManagerFactory {
    public init() { }

    public func produce() -> SessionManager & TweakReceiver {
        SessionManagerImpl()
    }
}
