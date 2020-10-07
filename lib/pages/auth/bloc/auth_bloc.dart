import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/models/auth_enums.dart';
import 'package:ecommerce_flutter/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  final RxSharedPreferences _rxSharedPreferences;

  AuthBloc({
    @required RxSharedPreferences rxSharedPreferences,
    @required AuthRepository authRepository,
  })  : assert(authRepository != null),
        _authRepository = authRepository,
        _rxSharedPreferences = rxSharedPreferences,
        super(AuthState.unknown());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthStatusRequested) {
      yield await _mapAuthStatusChangedToState(event);
    } else if (event is AuthLogoutRequested) {
      _authRepository.logout();
    }
  }

  Future<AuthState> _mapAuthStatusChangedToState(
      AuthStatusRequested event) async {
    String value = await _rxSharedPreferences.getString('TOKEN');
    return value != null
        ? const AuthState.authenticated()
        : const AuthState.unauthenticated();
  }
}
