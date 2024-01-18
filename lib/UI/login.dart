import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:trending_app/UI/dash_board.dart';
import 'package:trending_app/bloc/login/login_bloc.dart';
import 'package:trending_app/bloc/login/login_event.dart';
import 'package:trending_app/bloc/login/login_state.dart';
import 'package:trending_app/widgets/custom_textfield.dart';
import 'package:trending_app/widgets/password_textfield.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc,LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            _showLoadingDialog(context);
          } else if (state is LoginSuccess) {
            _dismissDialog(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBoard(),));
          } else if (state is LoginFailure) {
            _dismissDialog(context);
            _showErrorDialog(context, state.error);
          }
        },
        child:
        kIsWeb?
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.blue,
                child:Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width*0.08,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GoFinance',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                        ),const SizedBox(height: 10,),Text(
                          'The most popular peer to peer lending at SEA',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white),
                        ),const SizedBox(height: 20,),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 18),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Text(
                            'Read More',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: MediaQuery.of(context).size.width*0.08,),
                            Column(
                              children: [
                                Text(
                                  'Hello Again!',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                    'Welcome back',
                                    style: Theme.of(context).textTheme.titleSmall
                                ),
                              ],
                            ),
                            const Spacer()
                          ],
                        ),
                        const SizedBox(height: 30,),
                        SizedBox(width:MediaQuery.of(context).size.height*0.4,child: CustomTextField(controller: emailController,label: 'Email Address',prefixIcon: Icon(Icons.mail_outline),validator: (v) {
                          if (v==null || v.isEmpty) {
                            return 'Please enter an email address';
                          }else if (!emailRegex.hasMatch(v)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },isPassword: false,),),
                        const SizedBox(height: 15,),
                        SizedBox(width:MediaQuery.of(context).size.height*0.4,child: CustomTextField(controller: passwordController,label: 'Password',prefixIcon: Icon(Icons.lock),validator: (v) {
                          if (v==null || v.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },isPassword: true,),),
                        const SizedBox(height: 15,),
                        SizedBox(
                            width:MediaQuery.of(context).size.height*0.4,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(LoginButtonPressed(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim()
                                ),);
                              }
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
                        ),
                        const SizedBox(height: 10,),
                        GestureDetector(
                          onTap: () {

                          },
                          child: Text(
                            'Forgot Password?',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                  ),
             /*     (state is LoginLoading)?
                  const Center(
                    child: CircularProgressIndicator(),
                  ):const SizedBox()*/
                ],
              ),
            ),
          ],
        ):
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Form(
                key: _formKey,
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
                    CustomTextField(controller: emailController,label: 'Email Address',prefixIcon: Icon(Icons.mail_outline),validator: (v) {
                      if (v==null || v.isEmpty) {
                        return 'Please enter an email address';
                      }else if (!emailRegex.hasMatch(v)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },isPassword: false,),
                    const SizedBox(height: 15,),
                    CustomTextField(controller: passwordController,label: 'Password',prefixIcon: Icon(Icons.lock),validator: (v) {
                      if (v==null || v.isEmpty) {
                        return 'Please enter a password';
                      }
                      return null;
                    },isPassword: true,),
                    const SizedBox(height: 15,),
                    ElevatedButton(
                      onPressed: () {
                     if (_formKey.currentState!.validate()) {
                       context.read<LoginBloc>().add(LoginButtonPressed(
                           email: emailController.text.trim(),
                           password: passwordController.text.trim()
                       ),);
                     }
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
                    const SizedBox(height: 10,),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Forgot Password?',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),
                      ),
                    )
                  ],
                ),
              ),
            ),
            /*(state is LoginLoading)?
            const Center(
              child: CircularProgressIndicator(),
            ):const SizedBox()*/
          ],
        )
      ),
    );
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Logging in...'),
            ],
          ),
        );
      },
    );
  }

  void _dismissDialog(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _showErrorDialog(BuildContext context, String error) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Login failed: $error'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
