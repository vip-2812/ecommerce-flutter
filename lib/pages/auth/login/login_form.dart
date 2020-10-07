import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_flutter/pages/auth/login/bloc/login_bloc.dart';
import 'package:ecommerce_flutter/pages/auth/signup/signup_page.dart';
import 'package:ecommerce_flutter/pages/auth/widgets/already_have_an_account.dart';
import 'package:ecommerce_flutter/pages/auth/widgets/auth_input.dart';
import 'package:ecommerce_flutter/pages/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
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
      child: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .3,
          ),
          Container(
            height: MediaQuery.of(context).size.height * .7,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(88.0),
              ),
            ),
            child: LayoutBuilder(
              builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Text(
                            'Login',
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          buildWhen: (previous, current) =>
                              previous.email != current.email,
                          builder: (BuildContext context, state) {
                            return EmailInput(
                              validator: (value) {
                                return '';
                              },
                              labelText: 'Email',
                              onChanged: (email) => context
                                  .bloc<LoginBloc>()
                                  .add(LoginEmailChanged(email: email)),
                              hintText: 'test@gmail.com',
                              errorText:
                                  state.email.invalid ? 'invalid email' : null,
                            );
                          },
                        ),
                        BlocBuilder<LoginBloc, LoginState>(
                          buildWhen: (previous, current) =>
                              previous.password != current.password,
                          builder: (BuildContext context, state) {
                            return PasswordInput(
                              onChanged: (password) => context
                                  .bloc<LoginBloc>()
                                  .add(
                                      LoginPasswordChanged(password: password)),
                              hintText: '************',
                              labelText: 'Password',
                              validator: (value) {
                                return '';
                              },
                              errorText: state.password.invalid
                                  ? 'invalid password'
                                  : null,
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 48.0),
                          child: BlocBuilder<LoginBloc, LoginState>(
                            buildWhen: (previous, current) =>
                                previous.status != current.status,
                            builder: (BuildContext context, state) {
                              return state.status.isSubmissionInProgress
                                  ? CircularProgressIndicator()
                                  : ButtonTheme(
                                      minWidth:
                                          MediaQuery.of(context).size.width *
                                              .3,
                                      height: 42,
                                      child: RaisedButton(
                                        key: const Key(
                                            'loginForm_continue_raisedButton'),
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
                                                .bloc<LoginBloc>()
                                                .add(LoginSubmitted())
                                            : null,
                                      ),
                                    );
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 40.0),
                          child: AlreadyHaveAnAccountCheck(
                            login: true,
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage())),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
