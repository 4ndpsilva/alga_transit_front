import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuUI extends StatelessWidget{
  final Widget child;

  const MenuUI({required this.child});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('')),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text('')),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'), 
              onTap: () => _navigate(context, '/')
            ),
            ListTile(
              leading: Icon(Icons.admin_panel_settings),
              title: Text('Proprietários'), 
              onTap: () => _navigate(context, '/owners')
            ),
            ListTile(
              leading: Icon(Icons.car_rental),
              title: Text('Veículos'), 
              onTap: () => _navigate(context, '/vehicles')
            ),
            ListTile(
              leading: Icon(Icons.notes_rounded),
              title: Text('Autuações'), 
              onTap: () => _navigate(context, '/seizures')
            ),
            ListTile(
              leading: Icon(Icons.block),
              title: Text('Apreensões'), 
              onTap: () => _navigate(context, '/impounds')
            )
          ]
        ),
      ),
      body: child
    );
  }

  void _navigate(BuildContext context, String path){
    Navigator.pop(context);
    context.go(path);
  }
}