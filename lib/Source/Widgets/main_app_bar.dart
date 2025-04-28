import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build (BuildContext context){
    return AppBar(
      automaticallyImplyLeading: false,
      title: const Text("MUSIC APP BY MCHIEN", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: Colors.purple,),
        ),
      ],
    );
  }
}