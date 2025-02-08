import 'package:bloc_booking/presentation/bloc/home/home_cubit.dart';

import '../../../common_path.dart';
import '../home/layouts/dash_tab_view.dart';
import '../home/layouts/tab_menu.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => locator.get<HomeCubit>(),
        child: ListView(children: [
          //const FlightCheckIn(),
          GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 20.0), child: TabMenu()),
                    DashTabView(),
                  ]),
            ),
          )
        ]));
  }
}
