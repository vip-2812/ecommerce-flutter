import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/models/auth_model.dart';
import 'package:ecommerce_flutter/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';
import 'package:injectable/injectable.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';

part 'signup_event.dart';
part 'signup_state.dart';

@injectable
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository _authRepository;
  final RxSharedPreferences _rxSharedPreferences;

  SignupBloc({
    @required RxSharedPreferences rxSharedPreferences,
    @required AuthRepository authRepository,
  })  : assert(authRepository != null),
        _authRepository = authRepository,
        _rxSharedPreferences = rxSharedPreferences,
        super(const SignupState());

  @override
  Stream<SignupState> mapEventToState(
    SignupEvent event,
  ) async* {
    if (event is SignupNameChanged) {
      yield _mapNameChangedToState(event, state);
    } else if (event is SignupEmailChanged) {
      yield _mapEmailChangedToState(event, state);
    } else if (event is SignupPasswordChanged) {
      yield _mapPasswordChangedToState(event, state);
    } else if (event is SignupConfirmPasswordChanged) {
      yield _mapConfirmPasswordChangedToState(event, state);
    } else if (event is SignupSubmitted) {
      yield* _mapSignupSubmittedToState(event, state);
    }
  }

  SignupState _mapNameChangedToState(
    SignupNameChanged event,
    SignupState state,
  ) {
    final name = Name.dirty(event.name);
    return state.copyWith(
      name: name,
      status: Formz.validate([
        state.password,
        state.email,
        state.confirmPassword,
        name,
      ]),
    );
  }

  SignupState _mapEmailChangedToState(
    SignupEmailChanged event,
    SignupState state,
  ) {
    final email = Email.dirty(event.email);
    return state.copyWith(
      email: email,
      status: Formz.validate([
        state.name,
        state.password,
        state.confirmPassword,
        email,
      ]),
    );
  }

  SignupState _mapPasswordChangedToState(
    SignupPasswordChanged event,
    SignupState state,
  ) {
    final password = Password.dirty(event.password);
    return state.copyWith(
      password: password,
      status: Formz.validate([
        password,
        state.email,
        state.confirmPassword,
        state.name,
      ]),
    );
  }

  SignupState _mapConfirmPasswordChangedToState(
    SignupConfirmPasswordChanged event,
    SignupState state,
  ) {
    final confirmPassword = Password.dirty(event.confirmPassword);
    return state.copyWith(
      confirmPassword: confirmPassword,
      status: Formz.validate([
        confirmPassword,
        state.email,
        state.password,
        state.name,
      ]),
    );
  }

  Stream<SignupState> _mapSignupSubmittedToState(
    SignupSubmitted event,
    SignupState state,
  ) async* {
    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);
      try {
        String token = await _authRepository.signup(
          email: state.email.value,
          password: state.password.value,
        );
        _rxSharedPreferences.setString('TOKEN', token);
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      } on Exception catch (_) {
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
