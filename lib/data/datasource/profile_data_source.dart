import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:logging/logging.dart';

abstract interface class ProfileDataSource {
  Future<UserProfile> getLocalProfile();
}

class ProfileDataSourceImpl implements ProfileDataSource {
  ProfileDataSourceImpl(this._preference);

  final _log = Logger('ProfileDataSourceImpl');

  final PreferenceManager _preference;

  @override
  Future<UserProfile> getLocalProfile() async {
    try {
      final data = await _preference.getUserProfile();
      if (data != null) {
        return data;
      }
      _log.severe('local-profile', 'Profile not fount');
      throw const CacheException(message: 'Profile not fount');
    } catch (error, st) {
      _log.severe('logout', error, st);
      throw CacheException(message: error.toString());
    }
  }
}
