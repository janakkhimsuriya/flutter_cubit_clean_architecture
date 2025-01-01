import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final _log = Logger('RegisterScreen');

  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.r, horizontal: 30.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.r),
              child: ContentHeaderText(text: context.strings.register),
            ),
            ContainerWithTitleWidget(
              title: context.strings.contactDetails,
              child: Column(
                children: [
                  InputTextWidget(
                    controller: _fullName,
                    hintText: context.strings.fullName,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 10.r),
                  InputTextWidget(
                    controller: _email,
                    hintText: context.strings.emailAddress,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(height: 10.r),
                  InputTextWidget(
                    controller: _mobile,
                    hintText: context.strings.mobileNumber,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CustomButton(
                  label: context.strings.signUp,
                  size: ButtonSize.large,
                  autoResize: false,
                  onPressed: () {},
                ),
                SizedBox(height: 20.r),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      context.strings.alreadyHaveAccount,
                      style: context.textStyles.text14P18TText.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 5.r),
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: Text(
                        context.strings.loginHere,
                        style: context.textStyles.text14P18TText.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
