part of '../login_view.dart';

extension LoginViewPasswordExtension on LoginView {
  TextFormField buildPassword() {
    return TextFormField(
      controller: passwordController,
      validator: (value) =>
          (value ?? '').length > 5 ? null : StringConstants.validation,
      decoration: const InputDecoration(
        hintText: StringConstants.passoword,
      ),
    );
  }
}

extension LoginViewEmailExtension on LoginView {
  TextFormField buildEmail() {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        hintText: StringConstants.email,
      ),
    );
  }
}

extension LoginViewButtonExtension on LoginView {
  Widget buildLoginButton(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoginComplete) {
          const Card(
            child: Icon(Icons.check_circle_outline_outlined),
          );
        }
        return ElevatedButton(
            onPressed: () {
              context.read<LoginCubit>().pustUserModel();
            },
            child: const Text(StringConstants.login));
      },
    );
  }
}
