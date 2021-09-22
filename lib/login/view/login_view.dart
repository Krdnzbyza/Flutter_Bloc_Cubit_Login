import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../core/constants/string_constants.dart';
import '../service/login_service.dart';
import '../viewModel/login_cubit.dart';

part 'subView/login_sub_view.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
          formKey, emailController, passwordController,
          service:
              LoginService(Dio(BaseOptions(baseUrl: StringConstants.baseUrl)))),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginComplete) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text(StringConstants.loginSucces)));
          }
        },
        builder: (context, state) {
          return buildScaffold(context, state);
        },
      ),
    );
  }

  Scaffold buildScaffold(BuildContext context, LoginState state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Visibility(
          visible: context.watch<LoginCubit>().isLoading,
          child: const CircularProgressIndicator(),
        ),
        title: const Text(StringConstants.tittlelogin),
      ),
      body: Padding(
        padding: context.paddingMedium,
        child: Form(
          key: formKey,
          autovalidateMode: buildAutoValidate(state),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome ',
                  style: context.textTheme.headline2
                      ?.copyWith(fontWeight: FontWeight.bold)),
              SizedBox(height: context.dynamicHeight(0.04)),
              buildEmail(),
              buildPassword(),
              SizedBox(height: context.dynamicHeight(0.04)),
              buildLoginButton(context)
            ],
          ),
        ),
      ),
    );
  }

  AutovalidateMode buildAutoValidate(LoginState state) {
    return state is LoginValidateState
        ? (state.isValidate
            ? AutovalidateMode.always
            : AutovalidateMode.disabled)
        : AutovalidateMode.disabled;
  }
}
