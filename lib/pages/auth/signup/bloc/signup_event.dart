part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupEmailChanged extends SignupEvent {
  final String email;

  const SignupEmailChanged({this.email});

  @override
  List<Object> get props => [this.email];
}

class SignupPasswordChanged extends SignupEvent {
  final String password;

  const SignupPasswordChanged({this.password});

  @override
  List<Object> get props => [this.password];
}

class SignupConfirmPasswordChanged extends SignupEvent {
  final String confirmPassword;

  const SignupConfirmPasswordChanged({this.confirmPassword});

  @override
  List<Object> get props => [this.confirmPassword];
}

class SignupNameChanged extends SignupEvent {
  final String name;

  const SignupNameChanged({this.name});

  @override
  List<Object> get props => [this.name];
}

class SignupSubmitted extends SignupEvent {
  const SignupSubmitted();
}
