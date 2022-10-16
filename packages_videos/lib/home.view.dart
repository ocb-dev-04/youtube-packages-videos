import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart' as lockScreen;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _showLockScreen(context);
    });
  }

  Future<void> _showLockScreen(BuildContext context) => lockScreen.screenLock(
        context: context,
        correctString: '1234',
        canCancel: false,
        maxRetries: 3,
        useLandscape: true,
        didMaxRetries: (retries) => _maxRetries(context, retries),
        didConfirmed: (matchText) => _match(context, matchText),
        didError: (attempts) => _didError(context, attempts),
      );

  void _match(BuildContext context, String matchText) async {
    log('La clave de acceso es => ${matchText}');
  }

  void _maxRetries(BuildContext context, int maxRetries) async {
    log('Has intenado insertar la clave el maximo de veces posible');
  }

  void _didError(BuildContext context, int retries) {
    final remainingAttempts = 3 - retries;
    log('Quedan ${remainingAttempts} intentos');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home View'),
      ),
    );
  }
}
