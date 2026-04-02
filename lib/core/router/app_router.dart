import 'package:go_router/go_router.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/roi/screens/roi_list_screen.dart';
import '../../features/roi/screens/roi_detail_screen.dart';
import '../../features/poi/screens/poi_detail_screen.dart';
import '../../features/poi/screens/poi_create_screen.dart';
import '../../features/calendar/screens/calendar_screen.dart';
import '../../features/camera/screens/camera_screen.dart';
import '../../features/ticket/screens/ticket_screen.dart';
import '../../features/home/screens/sync_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/rois',
      builder: (context, state) => const RoiListScreen(),
    ),
    GoRoute(
      path: '/rois/:roiId',
      builder: (context, state) => RoiDetailScreen(
        roiId: state.pathParameters['roiId']!,
      ),
    ),
    GoRoute(
      path: '/rois/:roiId/pois/new',
      builder: (context, state) => PoiCreateScreen(
        roiId: state.pathParameters['roiId']!,
      ),
    ),
    GoRoute(
      path: '/rois/:roiId/pois/:poiId/edit',
      builder: (context, state) => PoiCreateScreen(
        roiId: state.pathParameters['roiId']!,
        editPoiId: state.pathParameters['poiId'],
      ),
    ),
    GoRoute(
      path: '/pois/:poiId',
      builder: (context, state) => PoiDetailScreen(
        poiId: state.pathParameters['poiId']!,
      ),
    ),
    GoRoute(
      path: '/calendar',
      builder: (context, state) => const CalendarScreen(),
    ),
    GoRoute(
      path: '/camera',
      builder: (context, state) => CameraScreen(
        poiId: state.uri.queryParameters['poiId'],
      ),
    ),
    GoRoute(
      path: '/tickets',
      builder: (context, state) => const TicketScreen(),
    ),
    GoRoute(
      path: '/sync',
      builder: (context, state) => const SyncScreen(),
    ),
  ],
);
