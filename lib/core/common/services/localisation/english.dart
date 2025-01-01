import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';

class English implements Language {
  @override
  String get appName => 'Sample App';

  @override
  String get loginDetails => 'Login Details';

  @override
  String get password => 'Username';

  @override
  String get username => 'Password';

  @override
  String get login => 'Login';

  @override
  String get signUp => 'Sign Up';

  @override
  String get register => 'Register';

  @override
  String get contactDetails => 'Contact Details';

  @override
  String get fullName => 'Full Name';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String get alreadyHaveAccount => 'Already got an account?';

  @override
  String get loginHere => 'Login here';

  @override
  String get logout => 'Logout';

  @override
  String get home => 'Home';
}
