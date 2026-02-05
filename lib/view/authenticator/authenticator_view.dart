import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mintly/utils/app_constants.dart/text_style_constants.dart';
import 'package:mintly/utils/config/biometric_util.dart';
import 'package:mintly/utils/widgets/black_button.dart';
import 'package:mintly/view/bottom_nav/view/bottom_nav_view.dart';

class AuthenticatorView extends StatefulWidget {
  static const String path = "/authenticator_view";
  static const String pathName = "authenticator_view";

  const AuthenticatorView({super.key});

  @override
  State<AuthenticatorView> createState() => _AuthenticatorViewState();
}

class _AuthenticatorViewState extends State<AuthenticatorView> {
  bool _isLoading = false;
  // bool? _isDeviceCapable;
  // bool? _isAuthenticationEnabled;
  Future<void> _checkBiometricStatus() async {
    if (_isLoading) return;

    setState(() => _isLoading = true);

    final isCapable = await bioMetricUtil.isDeviceCapable();
    final isEnabled = await bioMetricUtil.isBiometricEnabled();

    if (!mounted) return;

    if (isCapable && isEnabled) {
      // _isDeviceCapable = _isAuthenticationEnabled = true;
      final isAuthenticated = await bioMetricUtil.authenticate("Please authenticate to show account balance");

      if (!mounted) return;

      if (isAuthenticated) {
        await Future.delayed(const Duration(milliseconds: 300));
        if (!mounted) return;
        context.goNamed(BottomNavView.pathName);
        return;
      }
    } else {
      if (!mounted) return;
      context.goNamed(BottomNavView.pathName);
      return;
    }

    // Reset loader if auth fails
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    _checkBiometricStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 60),
                Text("App is Secured", style: TextStyleConstants.w500F14),
                const SizedBox(height: 10),
                BlackButton(width: 120, height: 40, borderRadius: 30, onTap: _checkBiometricStatus, text: "Authenticate", textSize: 12),
                SizedBox(height: 50),
                if (_isLoading) CircularProgressIndicator(color: Colors.black) else SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
