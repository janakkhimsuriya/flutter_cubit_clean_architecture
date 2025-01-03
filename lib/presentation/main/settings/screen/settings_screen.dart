import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      bottomNavigationBar: BottomButtonContainerWidget(
        child: CustomButton(
          label: context.strings.logout,
          autoResize: false,
          onPressed: () async {
            await context.authCubit.logout();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.r, horizontal: 30.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: ContentHeaderText(
                text: context.strings.settings,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
