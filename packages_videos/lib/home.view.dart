import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import 'details.view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late LocalAuthentication _auth;

  @override
  void initState() {
    super.initState();
    _auth = LocalAuthentication();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await authenticate();
    });
  }

  Future<void> authenticate() async {
    if (!await _isBiometricAvailable()) return;

    final listOfBiometrics = await _auth.getAvailableBiometrics();
    if (listOfBiometrics.isEmpty) return;

    bool isAuthenticated = await _auth.authenticate(
      localizedReason: 'Necesitamos tu informacion biometrica para proseguir',
      options: const AuthenticationOptions(
        stickyAuth: true,
        biometricOnly: false,
      ),
    );

    if (!isAuthenticated) return;

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailsView()));
  }

  Future<bool> _isBiometricAvailable() => _auth.canCheckBiometrics;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Necesitas autenticarte para tener acceso a la vista de detalles',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
            TextButton.icon(
              onPressed: () => authenticate(),
              icon: const Icon(Icons.perm_identity_rounded),
              label: const Text('Autenticarme'),
            )
          ],
        ),
      ),
    );
  }
}
