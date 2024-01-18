import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:trending_app/UI/dash_board.dart';
import 'package:trending_app/bloc/login/login_bloc.dart';
import 'package:trending_app/bloc/login/login_event.dart';
import 'package:trending_app/bloc/login/login_state.dart';
import 'package:trending_app/widgets/email_textfield.dart';
import 'package:trending_app/widgets/password_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = LoginBloc(dio: Dio());
    return BlocProvider(
      create: (context) => loginBloc,
      child: Scaffold(
        body: BlocBuilder<LoginBloc,LoginState>(
          builder: (context,state) {
           // if (state is LoginInitial) {
            if (state is LoginSuccess) {
              Future.delayed(Duration.zero,(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBoard(),));
              });
            }
            return IgnorePointer(
                ignoring:/*(state is LoginInitial)?true:*/false,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                           Text(
                            'Hello Again!',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                           Text(
                            'Welcome back',
                              style: Theme.of(context).textTheme.titleSmall
                          ),
                          const SizedBox(height: 30,),
                          const EmailTextField(),
                          const SizedBox(height: 15,),
                          const PasswordTextField(),
                          const SizedBox(height: 15,),
                          ElevatedButton(
                            onPressed: () {
                              context.read<LoginBloc>().add(LoginButtonPressed(
                                  email: '', // Replace with your email controller
                                  password: '' // Replace with your password controller
                              ),);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blue),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 18.0),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: () {

                            },
                            child: Text(
                              'Forgot Password?',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(decoration: TextDecoration.underline),
                            ),
                          )
                        ],
                      ),
                    ),
                    (state is LoginLoading)?
                    const Center(
                      child: CircularProgressIndicator(),
                    ):const SizedBox()
                  ],
                ),
              );
          }
        ),
      ),
    );
  }
}
