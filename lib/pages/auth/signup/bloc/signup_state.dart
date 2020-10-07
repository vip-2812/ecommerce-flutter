part of 'signup_bloc.dart';

class SignupState extends Equatable {
  const SignupState({
    this.status = FormzStatus.pure,
    this.name = const Name.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
  });

  final FormzStatus status;
  final Name name;
  final Email email;
  final Password password;
  final Password confirmPassword;

  SignupState copyWith({
    FormzStatus status,
    Name name,
    Email email,
    Password password,
    Password confirmPassword,
  }) {
    return SignupState(
      status: status ?? this.status,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }

  @override
  List<Object> get props => [status, name, email, password, confirmPassword];
}
