
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trending_app/bloc/login/login_event.dart';
import 'package:trending_app/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio dio=Dio();

  LoginBloc() : super(LoginInitial());
  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        Response response = await dio.post('https://reqres.in/api/login', data: {
          'email': event.email,
          'password': event.password,
        });
        if (response.statusCode == 200) {
          debugPrint(response.data.toString());
          yield LoginSuccess();
        } else {
          yield LoginFailure(error: 'Login failed. Please try again.');
        }
      } catch (e) {
        yield LoginFailure(error: 'An error occurred');
      }
    }
  }
}