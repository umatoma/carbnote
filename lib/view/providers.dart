// ignore_for_file: top_level_function_literal_block
import 'package:carbnote/repos/auth_user_repo.dart';
import 'package:carbnote/repos/menu_repo.dart';
import 'package:carbnote/repos/record_repo.dart';
import 'package:carbnote/repos/user_repo.dart';
import 'package:carbnote/view/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ---------- Repository ---------- //

final authUserRepoProvider = Provider((ref) => AuthUserRepo());
final userRepoProvider = Provider((ref) => UserRepo());
final recordRepoProvider = Provider((ref) => RecordRepo());
final menuRepoProvider = Provider.autoDispose((ref) {
  final repo = MenuRepo();
  ref.onDispose(() => repo.dispose());
  return repo;
});

// ---------- AuthUser ---------- //

final authUserStreamProvider = StreamProvider.autoDispose((ref) {
  return ref.read(authUserRepoProvider).onCurrentChanges();
});
final authUserProvider = Provider.autoDispose((ref) {
  return ref.watch(authUserStreamProvider).data?.value;
});

// ---------- User ---------- //

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
