import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/map/presentation/pages/map_page.dart';

import '../../Widgets/home_view_header.dart';
import '../../Widgets/material_list_view.dart';
import '../../Widgets/nearby_title_widget.dart';
import '../../Widgets/points_res_widget.dart';
import '../../Widgets/text_scale.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeViewHeader(),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    const SizedBox(height: 20.0),
                    const PointsAndRecWidget(),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Materials',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: getResponsiveFontSize(context,
                                      fontSize: 20.0),
                                ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const MaterialsListView(),
                    const SizedBox(height: 30.0),
                    const NearbyTitle(),
                    const SizedBox(height: 16.0),
                    const NearbyPlaceItem(),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
