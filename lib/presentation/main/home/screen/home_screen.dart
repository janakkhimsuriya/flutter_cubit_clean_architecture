import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              child: ContentHeaderText(text: context.strings.home),
            ),
            Center(
              child: CustomButton(
                label: context.strings.logout,
                size: ButtonSize.large,
                autoResize: false,
                onPressed: () async {
                  await context.authCubit.logout();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
