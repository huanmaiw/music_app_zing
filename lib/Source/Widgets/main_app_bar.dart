import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build (BuildContext context){
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text("CHIEN-21250620-K12CNNTT03", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),),
    );
  }
}