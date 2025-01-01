import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _log = Logger('LoginScreen');

  final _username = TextEditingController();
  final _password = TextEditingController();

  Future<void> _onLogin(BuildContext context) async {
    await context.authCubit.login(_username.text, _password.text);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 30.r, horizontal: 30.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30.r),
                  child: ContentHeaderText(text: context.strings.login),
                ),
                Column(
                  children: [
                    ContainerWithTitleWidget(
                      title: context.strings.loginDetails,
                      child: Column(
                        children: [
                          InputTextWidget(
                            controller: _username,
                            hintText: context.strings.username,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            isEnabled: state is! AuthLoading,
                          ),
                          SizedBox(height: 10.r),
                          InputTextWidget(
                            controller: _password,
                            hintText: context.strings.password,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            isEnabled: state is! AuthLoading,
                            onSubmitted: (text) => _onLogin(context),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.r),
                    CustomButton(
                      label: context.strings.login,
                      size: ButtonSize.large,
                      state: state is AuthLoading
                          ? ButtonState.loading
                          : ButtonState.enable,
                      autoResize: false,
                      onPressed: () => _onLogin(context),
                    ),
                  ],
                ),
                CustomButton(
                  label: context.strings.signUp,
                  size: ButtonSize.large,
                  autoResize: false,
                  onPressed: () {
                    context.push(AppRouteName.signup.path);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
