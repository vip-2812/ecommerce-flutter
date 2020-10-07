import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_flutter/models/auth_enums.dart';
import 'package:ecommerce_flutter/pages/auth/bloc/auth_bloc.dart';
import 'package:ecommerce_flutter/pages/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (BuildContext context, state) {
        if (state.status == AuthStatus.authenticated) {
          return ExtendedNavigator.of(context).push(Routes.homePage);
        } else {
          return ExtendedNavigator.of(context).push(Routes.loginPage);
        }
      },
      child: Scaffold(
        body: CircularProgressIndicator(),
      ),
    );
  }
}
