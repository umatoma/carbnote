// ignore_for_file: top_level_function_literal_block
import 'package:carbnote/repos/auth_user_repo.dart';
import 'package:carbnote/repos/record_repo.dart';
import 'package:carbnote/repos/user_repo.dart';
import 'package:carbnote/view/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ---------- Repository ---------- //

final authUserRepoProvider = Provider((ref) => AuthUserRepo());
final userRepoProvider = Provider((ref) => UserRepo());
final recordRepoProvider = Provider((ref) => RecordRepo());

// ---------- Model ---------- //

final authUserStreamProvider = StreamProvider.autoDispose((ref) {
  return ref.read(authUserRepoProvider).onCurrentChanges();
});
final authUserProvider = Provider.autoDispose((ref) {
  return ref.watch(authUserStreamProvider).data?.value;
});
final currentUserStreamProvider = StreamProvider.autoDispose((ref) {
  final authUser = ref.watch(authUserProvider);
  return authUser == null
      ? Stream.value(null)
      : ref.read(userRepoProvider).getOneStream(authUser.id);
});
final currentUserProvider = Provider.autoDispose((ref) {
  return ref.watch(currentUserStreamProvider).data?.value;
});

// ---------- Theme ---------- //

final themeProvider = StateProvider((ref) => cnThemeData);

// ---------- Navigator ---------- //

final navKeyProvider = Provider((ref) => GlobalKey<NavigatorState>());
