// ignore_for_file: constant_identifier_names

enum NetworkRoutes { AUTH, TEACHER, STUDENT }

extension NetworkRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.AUTH:
        return 'api/auth/';
      case NetworkRoutes.TEACHER:
        return 'api/teacher/';
      case NetworkRoutes.STUDENT:
        return 'api/student/';

      default:
        throw Exception('Route Not Found');
    }
  }
}
