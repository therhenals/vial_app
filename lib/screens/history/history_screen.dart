import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vial_app/providers/report_provider.dart';
import 'package:vial_app/screens/detail/detail_screen.dart';
import 'package:vial_app/widgets/widgets.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final report = ref.watch(reportProvider);

    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: report.reports.length,
      separatorBuilder: (_, __) => const SizedBox(height: 20),
      itemBuilder: (_, int index) {
        final item = report.reports[index];

        return GestureDetector(
          onTap: () {
            report.detail = item;
            showModalBottomSheet(
              context: context,
              builder: (_) => const DetailScreen(),
            );
          },
          child: Location(
            lat: item.lat,
            lng: item.lng,
            image:
                'https://storage.googleapis.com/app-nest-990e5.appspot.com/' +
                    item.urlPhoto,
          ),
        );
      },
    );
  }
}
