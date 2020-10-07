import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_flutter/pages/auth/signup/bloc/signup_bloc.dart';
import 'package:ecommerce_flutter/pages/auth/widgets/already_have_an_account.dart';
import 'package:ecommerce_flutter/pages/auth/widgets/auth_input.dart';
import 'package:ecommerce_flutter/pages/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocListener<SignupBloc, SignupState>(
      listener: (BuildContext context, SignupState state) {
        if (state.status.isSubmissionFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  'Login Failure',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
        } else if (state.status.isSubmissionSuccess) {
          return ExtendedNavigator.of(context).push(Routes.homePage);
        }
      },
      child: Container(
        height: size.height * .875,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(88.0),
          ),
        ),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    BlocBuilder<SignupBloc, SignupState>(
                      buildWhen: (previous, current) =>
                          previous.name != current.name,
                      builder: (BuildContext context, state) {
                        return AuthInput(
                          hintText: 'John Doe',
                          labelText: 'Full name',
                          onChanged: (name) => context
                              .bloc<SignupBloc>()
                              .add(SignupNameChanged(name: name)),
                          validator: (value) {
                            return '';
                          },
                          errorText: state.name.invalid ? 'Invalid name' : null,
                        );
                      },
                    ),
                    BlocBuilder<SignupBloc, SignupState>(
                      builder: (BuildContext context, state) {
                        return EmailInput(
                          validator: (value) {
                            return '';
                          },
                          labelText: 'Email',
                          onChanged: (email) => context
                              .bloc<SignupBloc>()
                              .add(SignupEmailChanged(email: email)),
                          hintText: 'test@gmail.com',
                          errorText:
                              state.email.invalid ? 'Invalid email' : null,
                        );
                      },
                    ),
                    BlocBuilder<SignupBloc, SignupState>(
                      builder: (BuildContext context, state) {
                        return PasswordInput(
                          onChanged: (password) => context
                              .bloc<SignupBloc>()
                              .add(SignupPasswordChanged(password: password)),
                          hintText: '************',
                          labelText: 'Password',
                          validator: (value) {
                            return '';
                          },
                          errorText: state.password.invalid
                              ? 'Invalid Password'
                              : null,
                        );
                      },
                    ),
                    BlocBuilder<SignupBloc, SignupState>(
                      builder: (BuildContext context, state) {
                        return PasswordInput(
                          onChanged: (confirmPassword) => context
                              .bloc<SignupBloc>()
                              .add(SignupConfirmPasswordChanged(
                                  confirmPassword: confirmPassword)),
                          hintText: '************',
                          labelText: 'Confirm Password',
                          validator: (confirmPassword) {
                            return '';
                          },
                          errorText: state.confirmPassword.invalid
                              ? 'Password Mismatch'
                              : null,
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 48.0),
                      child: BlocBuilder<SignupBloc, SignupState>(
                        buildWhen: (previous, current) =>
                            previous.status != current.status,
                        builder: (BuildContext context, state) {
                          return state.status.isSubmissionInProgress
                              ? CircularProgressIndicator()
                              : ButtonTheme(
                                  minWidth:
                                      MediaQuery.of(context).size.width * .3,
                                  height: 42,
                                  child: RaisedButton(
                                    key: const Key(
                                        'signupForm_continue_raisedButton'),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        bottomLeft: Radius.circular(10.0),
                                        bottomRight: Radius.circular(10.0),
                                      ),
                                    ),
                                    color: Colors.black87,
                                    textColor: Colors.white,
                                    child: Text('Login'),
                                    onPressed: state.status.isValidated
                                        ? () => context
                                            .bloc<SignupBloc>()
                                            .add(SignupSubmitted())
                                        : null,
                                  ),
                                );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: AlreadyHaveAnAccountCheck(
                        login: false,
                        onPressed: () => Navigator.pop(context),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
