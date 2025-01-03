import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30.r, horizontal: 30.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: ContentHeaderText(
                text: context.strings.profile,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
