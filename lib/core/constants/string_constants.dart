class StringConstants {
  static StringConstants? _instace;
  static StringConstants get instance {
    _instace ??= StringConstants._init();
    return _instace!;
  }

  StringConstants._init();
  static const tittlelogin = 'Flutter Cubit Bloc Example';
  static const login = 'Login';
  static const email = 'E-Mail';
  static const passoword = 'Password';
  static const validation = 'Şifreniz en az 5 basamaklı olmalıdır';
  static const loginSucces = "Login İşlemi Başarılı";
  static const baseUrl = "https://reqres.in";
}
