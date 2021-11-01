enum NetworkRoutes { LOGIN, REGISTER }

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return 'login';
      case NetworkRoutes.REGISTER:
        return 'register';
      default:
        throw Exception('Route Not Found');
    }
  }
}
