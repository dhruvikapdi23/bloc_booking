import 'package:bloc_booking/presentation/bloc/dashboard/dashboard_cubit.dart';
import 'package:bloc_booking/presentation/pages/home/layouts/flight_tab.dart';

import '../../../../common_path.dart';

class DashTabView extends StatelessWidget {
  const DashTabView({super.key});

  @override
  Widget build(BuildContext context) {
    DashboardCubit dash = context.read<DashboardCubit>();

    return BlocConsumer<DashboardCubit, DashboardState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (_, state) {
        return Expanded(
          flex: 2,
          child: PageView(
            controller: dash.pageController,
            physics: const ClampingScrollPhysics(),
            onPageChanged: (int i) => dash.pageViewOnChange(context, i),
            children: <Widget>[
              const FlightTab(),
              ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: const Center(
                  child: Text("Buy Now"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
