import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../providers/company_provider.dart';
import '../providers/location_provider.dart';

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
      body: Column(
        children: [
          companies.when(
            data: (companies) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: companies.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Text(companies[index].name),
                        ElevatedButton(
                          onPressed: () => searchCompany(companies[index].id),
                          child: const Text('pesquisar'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            error: (error, _) => const Text('f'),
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
