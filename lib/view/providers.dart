// ignore_for_file: top_level_function_literal_block
import 'package:carbnote/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ---------- Repository ---------- //

final authRepoProvider = Provider((ref) {
  return AuthRepo();
});

// ---------- State ---------- //

final currentUserProvider = StreamProvider.autoDispose((ref) {
  return ref.read(authRepoProvider).currentUserChanges();
});

// ---------- Navigator ---------- //

final navKeyProvider = Provider((ref) {
  return GlobalKey<NavigatorState>();
});
