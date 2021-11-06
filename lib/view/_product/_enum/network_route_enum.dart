enum NetworkRoutes { AUTH }

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.AUTH:
        return 'api/auth/';

      default:
        throw Exception('Route Not Found');
    }
  }
}
