import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_01_test/data/services/auth_services.dart';

import '../../model/signin_form_model.dart';
import '../../model/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      //AuthBLoC Login
      if (event is AuthLogin) {
        try {
          //inisialisasi loading
          emit(AuthLoading());

          //service login
          final user = await AuthServices().login(event.data);

          //login sukses
          emit(AuthSuccess(user));
        } catch (e) {
          // ignore: avoid_print
          print(e.toString());
          emit(AuthFailed(e.toString()));
        }
      }

      //authBLoC CurrentUser
      if (event is AuthGetCurrentUser) {
        try {
          //inisialisasi loading
          emit(AuthLoading());

          final SignInFormModel data =
              await AuthServices().getCredentialFromLocal();
          final UserModel user = await AuthServices().login(data);
          emit(AuthSuccess(user));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }

      if (event is AuthLogout) {
        try {
          emit(AuthLoading());

          final data = await AuthServices().logout();
          emit(AuthSuccessLogout(data));
        } catch (e) {
          emit(AuthFailed(e.toString()));
        }
      }
    });
  }
}
