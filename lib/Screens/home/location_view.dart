import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduation_project/Widgets/text_scale.dart';
import 'package:graduation_project/core/config/app_cubit/app_cubit.dart';
import 'package:graduation_project/features/map/presentation/pages/map_page.dart';

import '../../core/config/theme.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/svg/location.svg'),
                SizedBox(height: MediaQuery.sizeOf(context).height * 0.06),
                BlocBuilder<AppCubit, AppState>(
                  builder: (context, state) {
                    final bool isDark = state.themeMode == ThemeMode.dark;
                    return SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      child: Text(
                        'Share your location with us',
                        style: TextStyle(
                          fontSize:
                              getResponsiveFontSize(context, fontSize: 24.0),
                          fontWeight: FontWeight.bold,
                          color: isDark ? AppTheme.white : AppTheme.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.65,
                  child: Text(
                    'Please enter your location or allow access to your location to find all stations that are near you',
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(context, fontSize: 16.0),
                      fontWeight: FontWeight.w500,
                      color: AppTheme.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MapPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: AppTheme.white,
                    minimumSize:
                        Size(MediaQuery.sizeOf(context).width * 0.65, 50.0),
                  ),
                  child: Text(
                    'allow your locations',
                    style: TextStyle(
                      fontSize: getResponsiveFontSize(context, fontSize: 22.0),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
