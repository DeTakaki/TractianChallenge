class AppException implements Exception {
  final String _message;

  const AppException(this._message);

  @override
  String toString() {
    return 'Warning: $_message';
  }
}
