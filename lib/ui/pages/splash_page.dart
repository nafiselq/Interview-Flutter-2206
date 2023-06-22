import 'package:flutter/material.dart';
import 'package:flutter_01_test/data/blocs/auth/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kTextLogo,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          //Jika ada session user langsung ke halaman home
          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/home', (route) => false);
          }

          //Jika tidak ada session user langsung ke halaman login
          if (state is AuthFailed) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          }
        },
        child: Center(
          child: Text(
            "Flutter 2206 Test",
            style: whiteTextStyle.copyWith(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
