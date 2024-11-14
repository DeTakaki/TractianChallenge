import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../../constants/sizes/app_sizes.dart';
import '../providers/company_provider.dart';
import '../providers/location_provider.dart';
import '../widgets/company_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companies = ref.watch(getCompaniesFutureProvider);

    void searchCompany(String id) {
      ref.read(locationsQueryProvider.notifier).state = Some(id);
    }

    ref.listen(locationsStateProvider, (_, next) {
      next.whenOrNull(
        data: (data) {
          debugPrint('retornei $data');
        },
      );
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: Sizes.p32),
        child: Column(
          children: [
            companies.when(
              data: (companies) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Sizes.p20),
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: companies.length,
                    itemBuilder: (context, index) {
                      return CompanyCard(
                        company: companies[index],
                      );
                    },
                    separatorBuilder: (_, __) => gapH40,
                  ),
                );
              },
              error: (error, _) => const Text('f'),
              loading: () => const CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
