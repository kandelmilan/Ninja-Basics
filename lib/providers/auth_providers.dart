import 'package:flutter_riverpod/flutter_riverpod.dart';

// Current input
final emailProvider = StateProvider<String>((ref) => '');
final passwordProvider = StateProvider<String>((ref) => '');
final confirmPasswordProvider = StateProvider<String>((ref) => '');

// Registered credentials
final registeredEmailProvider = StateProvider<String>((ref) => '');
final registeredPasswordProvider = StateProvider<String>((ref) => '');
