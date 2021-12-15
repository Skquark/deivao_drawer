import 'package:flutter/material.dart';

mixin DrawerAnimationMixin<T extends StatefulWidget>
    on TickerProviderStateMixin<T> {
  AnimationController? controller;

  late Animation<double> drawerRotationAnim;
  Animation<double>? drawerScaleAnim;
  late Animation<Offset> drawerTranslationAnim;
  late Animation<Offset> scaffoldTranslationAnim;

  late bool enableDrawing;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    drawerRotationAnim = Tween<double>(
      begin: 0.3,
      end: 0,
    ).animate(controller!);

    drawerTranslationAnim = Tween<Offset>(
      begin: Offset(-50, MediaQuery.of(context).size.height * 0.05),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(parent: controller!, curve: Interval(0, 0.5)));

    drawerScaleAnim = Tween<double>(
      begin: 0.9,
      end: 1,
    ).animate(CurvedAnimation(parent: controller!, curve: Interval(0, 0.5)));

    scaffoldTranslationAnim = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(MediaQuery.of(context).size.width * 0.8, 0),
    ).animate(controller!);
  }

  void toggleDrawer() {
    if (controller!.value == 0)
      controller!.forward();
    else
      controller!.reverse();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
