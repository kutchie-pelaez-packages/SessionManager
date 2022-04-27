import SessionManager
import Tweaking

public struct SessionManagerFactory {
    public init() { }

    public func produce() -> SessionManager & TweakReceiver {
        SessionManagerImpl()
    }
}
