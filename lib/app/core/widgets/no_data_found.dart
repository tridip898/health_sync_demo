import 'package:flutter/material.dart';
import 'package:health_sync_question/app/core/constants/asset_path.dart';
import 'package:health_sync_question/app/core/constants/gap_constants.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';

class NoDataFound extends StatelessWidget {
  final Function()? onRefresh;

  const NoDataFound({super.key, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 96),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: radius8,
              child: Image.asset(AssetPath.noDataFoundIcon, height: 110),
            ),
            const SizedBox(height: 32),
            Text('Nothing to see here yet', style: textStyle.bold.s18),
            const SizedBox(height: 12),
            Text(
              'It looks like there is no data available\nto display at the moment.',
              textAlign: TextAlign.center,
              style: textStyle.medium.s16.copyWith(color: gray.base500),
            ),
            if (onRefresh != null) ...[
              const SizedBox(height: 32),
              GestureDetector(
                onTap: onRefresh,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.refresh, size: 20),
                    gapW8,
                    Text('Refresh Page', style: textStyle.semiBold.s16),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
