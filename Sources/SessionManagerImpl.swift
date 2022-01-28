import Core

final class SessionManagerImpl: SessionManager {
    @UserDefault("session", default: 0)
    private var storedSession: Int

    private func incrementSession() {
        storedSession += 1
    }

    // MARK: - Startable

    func start() {
        incrementSession()
    }

    // MARK: - SessionManager

    var session: Int {
        storedSession
    }
}
