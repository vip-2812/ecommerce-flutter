// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:http/http.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

import 'pages/auth/bloc/auth_bloc.dart';
import 'repository/auth_repository.dart';
import 'utils/injectable_modules.dart';
import 'pages/auth/login/bloc/login_bloc.dart';
import 'pages/auth/signup/bloc/signup_bloc.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final injectableModules = _$InjectableModules();
  gh.lazySingleton<Client>(() => injectableModules.httpClient);
  gh.lazySingleton<RxSharedPreferences>(
      () => injectableModules.rxSharedPreference);
  gh.lazySingleton<AuthRepository>(
      () => AuthRepository(httpClient: get<Client>()));
  gh.factory<LoginBloc>(() => LoginBloc(
      authRepository: get<AuthRepository>(),
      rxSharedPreferences: get<RxSharedPreferences>()));
  gh.factory<SignupBloc>(() => SignupBloc(
      rxSharedPreferences: get<RxSharedPreferences>(),
      authRepository: get<AuthRepository>()));
  gh.factory<AuthBloc>(() => AuthBloc(
      rxSharedPreferences: get<RxSharedPreferences>(),
      authRepository: get<AuthRepository>()));
  return get;
}

class _$InjectableModules extends InjectableModules {}
