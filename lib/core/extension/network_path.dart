enum ILoginServicePath { login }

extension ILoginServicePathExtension on ILoginServicePath {
  String get rawValue {
    switch (this) {
      case ILoginServicePath.login:
        return '/api/login';
    }
  }
}
