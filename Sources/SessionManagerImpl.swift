import Core

final class SessionManagerImpl: SessionManager {
    init() {
        incrementSession()
    }

    @UserDefault("session", default: 0)
    private var storedSession: Int

    private func incrementSession() {
        storedSession += 1
    }

    // MARK: - SessionManager

    var session: Int {
        storedSession
    }
}
