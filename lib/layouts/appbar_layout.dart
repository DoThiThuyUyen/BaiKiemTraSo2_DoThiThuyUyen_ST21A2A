import 'package:delivery_app/main.dart';
import 'package:flutter/material.dart';

class AppBarLayout extends StatefulWidget implements PreferredSizeWidget {
  const AppBarLayout({super.key});

  @override
  State<AppBarLayout> createState() => _AppBarLayoutState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _AppBarLayoutState extends State<AppBarLayout> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xffE5AB29),
      leading: Icon(Icons.arrow_back, color: Colors.white,),
      title: Text('Hỗ Trợ', style: TextStyle(color: Colors.white),),
      centerTitle: true,
    );
  }
}

