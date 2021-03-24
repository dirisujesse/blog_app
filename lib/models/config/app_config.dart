class AppConfig {
  static bool _isMock;
  
  static init({bool isMock = true}) {
    _isMock = isMock;
  }

  static bool get isMock {
    return _isMock ?? false;
  }
}