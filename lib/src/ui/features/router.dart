import 'package:auto_route/auto_route.dart';
import 'package:nave_fp_uol/src/ui/features/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Modal,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [];
}
