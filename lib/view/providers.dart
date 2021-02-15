// ignore_for_file: top_level_function_literal_block
import 'package:carbnote/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ---------- Repository ---------- //

final authRepoProvider = Provider((ref) {
  return AuthRepo();
});

// ---------- AuthUser ---------- //

final currentUserStreamProvider = StreamProvider.autoDispose((ref) {
  return ref.read(authRepoProvider).currentUserChanges();
});
final currentUserProvider = Provider.autoDispose((ref) {
  return ref.watch(currentUserStreamProvider).data?.value;
});

// ---------- Navigator ---------- //

final navKeyProvider = Provider((ref) {
  return GlobalKey<NavigatorState>();
});
