import Tweak

extension TweakID {
    public enum Session {
        public static var incrementSessionNumber: TweakID { TweakID() }
        public static var decrementSessionNumber: TweakID { TweakID() }
    }
}
