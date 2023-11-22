import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcm_project/application/login/bloc/login_bloc.dart';
import 'package:tcm_project/prensentation/login_signup/widgets/login_singup_button.dart';
import 'package:tcm_project/prensentation/login_signup/widgets/text_input.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final loginBloc = LoginBloc();
    return Scaffold(
      backgroundColor: themeData.colorScheme.primary,
      appBar: AppBar(
        //centerTitle: true,
        title: Row(
          children: [
            Expanded(
                child: SizedBox(child: Center(child: Text('TCCM - Register' , style: themeData.textTheme.displayLarge,)))),
            const SizedBox(
              height: 50,
              width: 50,
              child: Image(image: AssetImage('assets/images/Logo.png')),
            )
          ],
        ),
        backgroundColor: themeData.appBarTheme.backgroundColor,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const BackButtonIcon(),
          splashRadius: 23,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Center(
            child: Column(
              children: [
                const TextInput(textLabel: 'Username', isPassword: false),
                const TextInput(textLabel: 'E-mail', isPassword: false),
                const TextInput(textLabel: 'Password', isPassword: true),
                const TextInput(
                    textLabel: 'Confirm Password', isPassword: true),
                const SizedBox(height: 40),
                BlocBuilder<LoginBloc, LoginState>(
                bloc: loginBloc,
                builder: (context, loginState) {
                  bool pressed;
                  if (loginState is LoginButtonPressedState) {
                    pressed = true;
                  }else{
                    pressed = false;
                  }
                  return LoginSignUpButton(
                    buttonText: 'Sign up',
                    pressed: pressed,
                    ontab: () async {
                      loginBloc.add(LoginButtonPressedEvent());
                      await Future.delayed(const Duration(seconds: 2));
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
