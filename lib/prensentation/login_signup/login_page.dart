import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tcm_project/application/login/bloc/login_bloc.dart';
import 'package:tcm_project/application/utility/bloc/utility_bloc.dart';
import 'package:tcm_project/prensentation/login_signup/widgets/login_singup_button.dart';
import 'package:tcm_project/prensentation/login_signup/widgets/remember_user.dart';
import 'package:tcm_project/prensentation/login_signup/widgets/text_input.dart';

class Login extends StatelessWidget {
  final bool rememberUser;
  const Login({super.key, required this.rememberUser});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final rememberMeBloc = UtilityBloc();
    final loginBloc = LoginBloc();
    bool rememberUser = this.rememberUser;

    return Scaffold(
      backgroundColor: themeData.colorScheme.primary,
      appBar: AppBar(
        centerTitle: true,
        title: Text('TCCM - Login', style: themeData.textTheme.displayLarge,),
        backgroundColor: themeData.appBarTheme.backgroundColor,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40, bottom: 40),
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image(image: AssetImage('assets/images/Logo.png')),
                ),
              ),
              const TextInput(
                textLabel: 'Username',
                isPassword: false,
              ),
              const TextInput(
                textLabel: 'Password',
                isPassword: true,
              ),
              BlocBuilder<UtilityBloc, UtilityState>(
                bloc: rememberMeBloc,
                builder: (context, rememberMeState) {
                  if (rememberMeState is RememberMePressedState) {
                    rememberUser = rememberMeState.isChecked;
                  }
                  return RememberUserCheckbox(
                    checkboxText: 'Remember me',
                    isChecked: rememberUser,
                    rememberMeBloc: rememberMeBloc,
                  );
                },
              ),
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
                    buttonText: 'Login',
                    pressed: pressed,
                    ontab: () async {
                      loginBloc.add(LoginButtonPressedEvent());
                      await Future.delayed(const Duration(seconds: 2));
                      Navigator.of(context).pushReplacementNamed('/home');
                    },
                  );
                },
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont have an account?     ', style: themeData.textTheme.bodyLarge!.copyWith(fontSize: 12, color: themeData.appBarTheme.backgroundColor, fontWeight: FontWeight.bold),),
                  InkWell(
                    onTap: () => Navigator.of(context).pushNamed('/signUp'),
                    child: Text(
                      'Sign up',
                      style: themeData.textTheme.bodyLarge!.copyWith(color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
