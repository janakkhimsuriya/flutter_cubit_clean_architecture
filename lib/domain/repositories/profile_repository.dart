import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';

abstract interface class ProfileRepository {
  ResultFuture<UserProfile> getLocalProfile();
}
