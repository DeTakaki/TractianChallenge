import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/core_repository.dart';
import '../../domain/asset.dart';

final assetsStateProvider =
    Provider.autoDispose<AsyncValue<List<Asset>>>((ref) {
  final companyId = ref.watch(assetsQueryProvider);
  return companyId.match(
    () => const AsyncData([]),
    (id) => ref.watch(
      assetsFutureProvider(id),
    ),
  );
});

final assetsQueryProvider =
    StateProvider.autoDispose<Option<String>>((_) => const None());

final assetsFutureProvider = FutureProvider.autoDispose
    .family<List<Asset>, String>((ref, companyId) async {
  final repository = ref.read(coreRepositoryProvider);
  return await repository.getAssets(companyId: companyId);
});
