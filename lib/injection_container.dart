
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:bloc_booking/presentation/bloc/bags_selection/bags_selection_cubit.dart';
import 'package:bloc_booking/presentation/bloc/dashboard/dashboard_cubit.dart';
import 'package:bloc_booking/presentation/bloc/flight_list/flight_list_cubit.dart';
import 'package:bloc_booking/presentation/bloc/home/home_cubit.dart';

import 'package:bloc_booking/presentation/bloc/intro/intro_cubit.dart';
import 'package:bloc_booking/presentation/bloc/my_flight/my_flight_cubit.dart';
import 'package:bloc_booking/presentation/bloc/my_flight_booking/my_flight_booking_cubit.dart';
import 'package:bloc_booking/presentation/bloc/otp/otp_cubit.dart';
import 'package:bloc_booking/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:bloc_booking/presentation/bloc/signup/signup_cubit.dart';
import 'package:bloc_booking/presentation/bloc/splash/splash_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/helper/global.dart';
import 'core/network/network_info.dart';
import 'data/data_sources/local_data_source.dart';
import 'data/data_sources/remote_data_source.dart';
import 'data/repositories/user_repository_impl.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/use_cases/login_user_case.dart';
import 'presentation/bloc/app/app_bloc.dart';

final GetIt locator = GetIt.instance;

Future<void> setUp() async {
  // Features
  locator.registerFactory(() => AppBloc(localDataSource: locator()));
  // Register Factory
  locator.registerFactory(() => SplashCubit(localDataSource: locator(),loginUseCase: locator()));
  locator.registerFactory(() => IntroCubit());
  locator.registerFactory(() => SignupCubit());
  locator.registerFactory(() => DashboardCubit());

  locator.registerFactory(() => SignInCubit());
  locator.registerFactory(() => OtpCubit());
  locator.registerFactory(() => HomeCubit());
  locator.registerFactory(() => MyFlightCubit());
  locator.registerFactory(() => MyFlightBookingCubit());
  locator.registerFactory(() => FlightListCubit());
  locator.registerFactory(() => BagsSelectionCubit());

  // Use case
  locator.registerLazySingleton(() => LoginUseCase(userRepository: locator()));

  // Repositories
  locator.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(remoteDataSource: locator(), networkInfo: locator()));


  // Data source
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(client: locator()));

  locator.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sharedPreferences: locator()));

  // Core
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnection: locator()));
  locator.registerLazySingleton(() => GlobalVariable());

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => InternetConnection());
}
