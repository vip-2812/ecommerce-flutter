import 'package:auto_route/auto_route.dart';
import 'package:ecommerce_flutter/injection.dart';
import 'package:ecommerce_flutter/pages/auth/bloc/auth_bloc.dart';
import 'package:ecommerce_flutter/pages/routes/router.gr.dart' as router;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          getIt<AuthBloc>()..add(AuthStatusRequested()),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: ExtendedNavigator.builder(
          router: router.Router(),
        ),
      ),
    );
  }
}
