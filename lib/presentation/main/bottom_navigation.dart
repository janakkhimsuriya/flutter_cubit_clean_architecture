import 'package:flutter/material.dart';
import 'package:flutter_bloc_architecture/flutter_bloc_architecture.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({required this.navigationShell, Key? key})
      : super(key: key ?? const ValueKey<String>('BottomNavigation'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: ColoredBox(
        color: cGrayLight,
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: _BottomNavigationItem(
                  label: context.strings.home,
                  isSelected: navigationShell.currentIndex == 0,
                  onTap: () => navigationShell.goBranch(0),
                ),
              ),
              Expanded(
                child: _BottomNavigationItem(
                  label: context.strings.profile,
                  isSelected: navigationShell.currentIndex == 1,
                  onTap: () => navigationShell.goBranch(1),
                ),
              ),
              Expanded(
                child: _BottomNavigationItem(
                  label: context.strings.settings,
                  isSelected: navigationShell.currentIndex == 2,
                  onTap: () => navigationShell.goBranch(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavigationItem extends StatelessWidget {
  const _BottomNavigationItem({
    required this.onTap,
    required this.label,
    this.isSelected = false,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: cGrayLight,
      child: InkWell(
        key: key,
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 10.r),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 1.r),
              margin: EdgeInsets.symmetric(horizontal: 5.r),
              decoration: BoxDecoration(
                color: isSelected ? cBottomLabelColor : Colors.transparent,
                borderRadius: BorderRadius.circular(8.r),
              ),
              constraints: BoxConstraints(maxWidth: 120.r, minWidth: 120.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    label,
                    style: context.textStyles.text12P14TText.copyWith(
                      color: cTextColorLight,
                      fontWeight: FontWeight.w500,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.r),
          ],
        ),
      ),
    );
  }
}
