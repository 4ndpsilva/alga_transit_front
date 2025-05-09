import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuUI extends StatelessWidget{
  final Widget child;

  const MenuUI({required this.child});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blueAccent),
              child: Center(
                child: Text('ALGA TRANSIT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24
                  )
                )
              )
            ),
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
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () => print('Sair')
            )
          ]
        )
      ),
      body: child
    );
  }

  void _navigate(BuildContext context, String path){
    Navigator.pop(context);
    context.go(path);
  }
}