import 'package:go_router/go_router.dart';
import 'package:alga_transit_front/src/application/ui/impound/impound_ui.dart';
import 'package:alga_transit_front/src/application/ui/seizure/seizure_ui.dart';
import 'package:alga_transit_front/src/application/ui/vehicle/vehicle_ui.dart';
import 'package:alga_transit_front/src/application/ui/base/menu_ui.dart';
//import 'package:alga_transit_front/src/application/ui/owner/owner_ui.dart';
import 'package:alga_transit_front/src/application/ui/owner/owner_list_ui.dart';
import 'package:alga_transit_front/src/application/ui/base/home_ui.dart';

final GoRouter _router = GoRouter(initialLocation: '/', routes : _routes);

get routers => _router;

final _routes = [
  ShellRoute(
    builder: (context, state, child) => MenuUI(child: child),
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeUI()),
      //GoRoute(path: '/owners', builder: (context, state) => OwnerUI()),
      GoRoute(path: '/owners', builder: (context, state) => OwnerListUI()),
      GoRoute(path: '/vehicles', builder: (context, stete) => VehicleUI()),
      GoRoute(path: '/seizures', builder: (context, state) => SeizureUI()),
      GoRoute(path: '/impounds', builder: (context, state) => ImpoundUI())
    ]
  )
];