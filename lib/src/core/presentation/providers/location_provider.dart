import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/core_repository.dart';
import '../../domain/location.dart';

final locationsQueryProvider =
    StateProvider.autoDispose<Option<String>>((_) => const None());

final locationsFutureProvider =
    AutoDisposeFutureProviderFamily<List<Location>, String>(
        (ref, companyId) async {
  final repository = ref.read(coreRepositoryProvider);
  return await repository.getLocations(companyId: companyId);
});

final locationsStateProvider =
    AutoDisposeNotifierProvider<LocationsNotifier, AsyncValue<List<Location>>>(
        LocationsNotifier.new);

class LocationsNotifier
    extends AutoDisposeNotifier<AsyncValue<List<Location>>> {
  @override
  AsyncValue<List<Location>> build() {
    listenSelf((_, next) {
      next.whenOrNull(
        data: (data) {
          debugPrint('data $data');
        },
      );
    });

    final locationId = ref.watch(locationsQueryProvider);

    return locationId.match(
      () => const AsyncData([]),
      (id) => ref.watch(
        locationsFutureProvider(id),
      ),
    );
  }
}
