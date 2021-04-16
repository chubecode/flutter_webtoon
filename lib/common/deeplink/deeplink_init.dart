class DeeplinkInit {
  String? _initDeeplink;

  void updateInitDeeplink(String? initDeeplink) {
    _initDeeplink = initDeeplink;
  }

  void clearInitDeeplink() {
    _initDeeplink = null;
  }

  String? getInitDeeplink() {
    return _initDeeplink;
  }
}
