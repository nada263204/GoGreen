import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/object_detecting/presentation/screens/scan_cubit.dart';

import '../../../../core/config/theme.dart';
import '../../../../Widgets/text_scale.dart';

class ScanItemInfo extends StatelessWidget {
  const ScanItemInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: MediaQuery.sizeOf(context).height * 0.15,
        decoration: BoxDecoration(
          color: AppTheme.primaryLight.withOpacity(0.1),
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            width: 2.0,
            color: AppTheme.primary,
          ),
        ),
        child: BlocBuilder<ScanCubit, ScanState>(
          builder: (context, state) {
            String recognitionText = '';
            if (state is ScanLoaded) {
              recognitionText = state.recognition;
            } else if (state is ScanError) {
              recognitionText = 'Error: ${state.error}';
            } else if (state is ScanLoading) {
              recognitionText = 'Loading...';
            }
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _itemInfoWidget(
                    context,
                    title: 'Material',
                    subtitle: recognitionText.isEmpty
                        ? 'No recognition yet'
                        : recognitionText,
                  ),
                  Container(
                    width: 2.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  _itemInfoWidget(context, title: 'Point', subtitle: '2'),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Column _itemInfoWidget(BuildContext context,
      {required String title, required String subtitle}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 16.0),
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 16.0),
            fontWeight: FontWeight.w500,
            color: AppTheme.black,
          ),
        ),
      ],
    );
  }
}
