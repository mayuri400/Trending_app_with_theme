import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:trending_app/bloc/login/login_event.dart';
import 'package:trending_app/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final Dio dio;

  LoginBloc({required this.dio}) : super(LoginInitial()){
    on<LoginButtonPressed>(_onButtonPressed);
  }

  Future<void> _onButtonPressed(
      LoginEvent event,
      Emitter<LoginState> emit,
      ) async{
    emit(LoginLoading());
    try {
      Response response = await dio.post('https://reqres.in/api/login', data: {
        'email': "eve.holt@reqres.in",//event.email,
        'password': "cityslicka"//event.password,
      });
      if (response.statusCode == 200) {
        debugPrint(response.data.toString());
        emit(LoginSuccess());
      } else {
        emit( LoginFailure(error: 'Login failed. Please try again.'));
      }
    } catch (error) {
      emit( LoginFailure(error: 'An error occurred. Please try again.'));
    }
  }
}