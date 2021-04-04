// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i4;
import 'package:suga_core/suga_core.dart' as _i5;

import 'injector.dart' as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final mainModule = _$MainModule();
  gh.lazySingleton<_i3.Logger>(() => mainModule.getLogger());
  await gh.lazySingletonAsync<_i4.SharedPreferences>(
      () => mainModule.getSharePreferences(),
      preResolve: true);
  gh.lazySingleton<_i5.HttpClientWrapper>(
      () => mainModule.getHttpClientWrapper(get<_i3.Logger>()));
  return get;
}

class _$MainModule extends _i6.MainModule {}
