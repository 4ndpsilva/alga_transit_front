import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:alga_transit_front/src/domain/owner/owner_provider.dart';
import 'package:alga_transit_front/src/domain/vehicle/vehicle_provider.dart';
import 'package:alga_transit_front/src/infrastructure/routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => OwnerProvider()),
        ChangeNotifierProvider(create: (context) => VehicleProvider())
      ],
      child: MainApp()
    )
  );
}

class MainApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      title: 'Alga Transit',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      routerConfig: routers
    );
  }
}