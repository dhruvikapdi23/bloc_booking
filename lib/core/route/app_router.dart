import 'package:go_router/go_router.dart';
import 'package:bloc_booking/presentation/pages/dashboard/dashboard.dart';
import 'package:bloc_booking/presentation/pages/intro/intro.dart';
import 'package:bloc_booking/presentation/pages/my_flight/my_flight.dart';
import 'package:bloc_booking/presentation/pages/notification_permission/notification_permission.dart';
import 'package:bloc_booking/presentation/pages/otp/otp.dart';
import 'package:bloc_booking/presentation/pages/sign_in/signin.dart';
import 'package:bloc_booking/presentation/pages/sign_up/signup.dart';

import '../../data/data_sources/local_data_source.dart';
import '../../injection_container.dart';

import '../../presentation/pages/booking_seat_preference/booking_seat_preference.dart';
import '../../presentation/pages/flight_book_detail/flight_book_detail.dart';
import '../helper/global.dart';
import 'page_list.dart';
import 'route_names.dart';

final LocalDataSource localDatSource = locator.get<LocalDataSource>();
final GlobalVariable globalVariable = locator.get<GlobalVariable>();

class AppRouter {
  final GoRouter router = GoRouter(
    errorBuilder: (context, state) => const Page404(),
    navigatorKey: globalVariable.navState,
    redirect: (context, state) async {
      /*if (state.location != '/' && state.location != '/login') {
        bool isLogin = await localDatSource.isLogin();
        return isLogin ? null : '/login';
      } else {
        return null;
      }*/

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: RouteName.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/intro',
        name: RouteName.intro,
        builder: (context, state) => const IntroScreen(),
      ),
      GoRoute(
          path: '/signup',
          name: RouteName.signup,
          builder: (context, state) => const Signup()),
      GoRoute(
          path: '/signIn',
          name: RouteName.signIn,
          builder: (context, state) => const SignIn()),
      GoRoute(
          path: '/otp',
          name: RouteName.otp,
          builder: (context, state) => const Otp()),
      GoRoute(
          path: '/notificationPermission',
          name: RouteName.notificationPermission,
          builder: (context, state) => const NotificationPermission()),
      GoRoute(
          path: '/dashboard',
          name: RouteName.dashboard,
          builder: (context, state) => const Dashboard()),
      GoRoute(
          path: '/flightList',
          name: RouteName.flightList,
          builder: (context, state) => const MyFlight()),
      GoRoute(
          path: '/bookingSeatPreference',
          name: RouteName.bookingSeatPreference,
          builder: (context, state) => const BookingSeatPreference()),
      GoRoute(
          path: '/bookingDetail',
          name: RouteName.bookingDetail,
          builder: (context, state) => const FlightBookingDetailInit()),
      /* GoRoute(
        path: '/login',
        name: RouteName.login,
        builder: (context, state) => const LoginPage(),
        routes: [
          GoRoute(
            path: 'otp',
            name: RouteName.otp,
            builder: (context, state) {
              Map<String, dynamic>? data;
              if (state.uri.queryParameters['data'] != null) {
                data = jsonDecode(state.uri.queryParameters['data']!);
              }
              return OtpPage(
                data: data,
              );
            },
            routes: [
              GoRoute(
                path: 'city',
                name: RouteName.city,
                builder: (context, state) => const CityPage(),
              ),
            ],
          ),
          GoRoute(
            path: 'pujoCorner',
            name: RouteName.pujoCorner,
            builder: (context, state) => const PujoCornerPage(),
          ),
          GoRoute(
            path: 'upcomingMeetup',
            name: RouteName.upcomingMeetup,
            builder: (context, state) => const UpcomingMeetupPage(),
            routes: [
              GoRoute(
                path: 'add',
                name: RouteName.add,
                builder: (context, state) {
                  Map<String, dynamic>? data;
                  if (state.uri.queryParameters['data'] != null) {
                    data = jsonDecode(state.uri.queryParameters['data']!);
                  }
                  return AddPage(
                    data: data,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: 'postDetail',
            name: RouteName.postDetail,
            builder: (context, state) {
              Map<String, dynamic>? data;
              if (state.uri.queryParameters['data'] != null) {
                data = jsonDecode(state.uri.queryParameters['data']!);
              }
              return PostDetailPage(data: data!);
            },
          ),
          GoRoute(
            path: 'service',
            name: RouteName.service,
            builder: (context, state) => const ServicePage(),
            routes: [
              GoRoute(
                path: 'service-detail',
                name: RouteName.serviceDetail,
                builder: (context, state) => const ServiceDetailPage(),
              ),
              GoRoute(
                path: 'service-list',
                name: RouteName.serviceList,
                builder: (context, state) => const ServiceListPage(),
              ),
            ],
          ),
          GoRoute(
            path: 'profile',
            name: RouteName.profile,
            builder: (context, state) => const ProfilePage(),
            routes: [
              GoRoute(
                path: 'registerBusiness',
                name: RouteName.registerBusiness,
                builder: (context, state) => const RegisterBusinessPage(),
              ),
            ],
          ),
        ],
      ),*/
      /* GoRoute(
        path: '/dashBoard',
        name: RouteName.dashBoard,
        builder: (context, state) => const DashBoardPage(),
      ),
      GoRoute(
        path: '/notification',
        name: RouteName.notification,
        builder: (context, state) => const NotificationPage(),
      ),
      GoRoute(
        path: '/myActivity',
        name: RouteName.myActivity,
        builder: (context, state) => const MyActivityPage(),
      ),
      GoRoute(
        path: '/search',
        name: RouteName.search,
        builder: (context, state) => const SearchPage(),
      ),*/
    ],
  );
}
