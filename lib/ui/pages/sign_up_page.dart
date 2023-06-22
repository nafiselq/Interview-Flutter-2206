import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../shared/theme.dart';
import '../widget/custom_button.dart';
import '../widget/custom_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Title
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30.0),
        child: Text(
          'Login Page Test Script\nElisoft Technology Indonesia',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
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
          label: "Email Address",
          hintText: "Your Email Address",
        );
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

      // Text Button
      Widget signUpButton() {
        return Container(
          alignment: Alignment.center,
          child: Expanded(
            child: Row(
              children: [
                Text(
                  "Don't have account yet?",
                  style: greyTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: light,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: greyTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: bold,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      // Return Input Section
      return Container(
        margin: const EdgeInsets.only(top: 30),
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
                  if (formKey.currentState!.validate()) {}
                },
              ),
              signUpButton(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            //Header Tittle
            title(),
            //Column Input Section
            inputSection(),
          ],
        ),
      ),
    );
  }
}
