import 'package:flutter/material.dart';
import 'package:flutter_01_test/data/blocs/auth/auth_bloc.dart';
import 'package:flutter_01_test/ui/pages/home_page.dart';
import 'package:flutter_01_test/ui/pages/sign_in_page.dart';
import 'package:flutter_01_test/ui/pages/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/home': (context) => const HomePage(),
        },
      ),
    );
  }
}
