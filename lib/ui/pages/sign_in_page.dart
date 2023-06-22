import 'package:flutter/material.dart';
import 'package:flutter_01_test/data/blocs/auth/auth_bloc.dart';
import 'package:flutter_01_test/data/model/signin_form_model.dart';
import 'package:flutter_01_test/shared/shared_method.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../shared/theme.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_form_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Logo & Title
    Widget headerLogo() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        width: 322,
        height: 384,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/img_logo.png",
            ),
          ),
        ),
        child: Column(
          children: [
            Text(
              "My APPS",
              style: primaryTextStyle.copyWith(
                fontSize: 40,
                fontWeight: bold,
              ),
            )
          ],
        ),
      );
    }

    //Input Section
    Widget inputSection() {
      // Form Field Email
      Widget emailInput() {
        return CustomTextFormField(
            validator: MultiValidator([
              RequiredValidator(errorText: "Required"),
              EmailValidator(errorText: "Please enter a valid email address"),
            ]),
            controller: emailController,
            label: "Username",
            hintText: "Your Email Address");
      }

      // From Field Password
      Widget passwordInput() {
        return CustomTextFormField(
          validator: MultiValidator([
            RequiredValidator(errorText: "Required"),
            MinLengthValidator(8,
                errorText: "Password must contain atleast 8 characters"),
          ]),
          controller: passwordController,
          label: "Password",
          hintText: "Your Password",
          isObscure: true,
        );
      }

      // Return Input Section
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius),
        ),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              emailInput(),
              passwordInput(),
              CustomButton(
                title: 'Sign In Now',
                onPressed: () {
                  if (emailController.text.isEmpty) {
                    return showCustomSnackbar(
                        context, 'Email tidak boleh kosong');
                  }
                  if (passwordController.text.isEmpty) {
                    return showCustomSnackbar(
                        context, 'Password tidak boleh kosong');
                  }
                  if (formKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(
                          AuthLogin(
                            SignInFormModel(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          ),
                        );

                    //jika berhasil redirect ke home page
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  }
                },
              ),
              // signUpButton(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Stack(
              children: [
                SafeArea(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    children: [
                      //Header logo & title
                      headerLogo(),
                      //Column Input Section
                      inputSection(),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: kGreyColor.withOpacity(0.7),
                  child: Center(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        backgroundColor: kTextLogo.withOpacity(0.5),
                        strokeWidth: 5,
                        color: kBlackColor,
                      ),
                    ),
                  ),
                )
              ],
            );
          }
          return SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              children: [
                //Header logo & title
                headerLogo(),
                //Column Input Section
                inputSection(),
              ],
            ),
          );
        },
      ),
    );
  }
}
