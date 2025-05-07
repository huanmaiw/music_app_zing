import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build (BuildContext context){
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text("Music App", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),),
    );
  }
}