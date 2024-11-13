import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/core_repository.dart';
import '../../domain/company.dart';

final getCompaniesFutureProvider =
    FutureProvider.autoDispose<List<Company>>((ref) async {
  final repository = ref.read(coreRepositoryProvider);

  return await repository.getCompanies();
});
