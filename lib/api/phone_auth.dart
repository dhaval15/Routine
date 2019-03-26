import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

enum PhoneAuthStatus {
  initial,
  invalidPhoneNumber,
  sendingCode,
  codeSent,
  verifyingCode,
  invalidCode,
  displayName,
  updatingDisplayName,
  welcome,
  successful
}

class PhoneAuthAPI {
  final _controller = StreamController<PhoneAuthStatus>();
  String verificationId;
  FirebaseUser user;

  void init() async {
    final u = FirebaseAuth.instance.currentUser();
    if (u != null) _controller.add(PhoneAuthStatus.successful);
  }

  Future<String> get displayName async {
    if (user.displayName != null)
      return user.displayName;
    else
      return (await FirebaseAuth.instance.currentUser()).displayName;
  }

  Stream<PhoneAuthStatus> get stream => _controller.stream;

  bool _verify(String phoneNumber) {
    if (phoneNumber.length != 13) {
      _controller.sink.add(PhoneAuthStatus.invalidPhoneNumber);
      return false;
    }
    return true;
  }

  void sendCode(String phoneNumber) {
    if (!_verify(phoneNumber)) return;
    _controller.sink.add(PhoneAuthStatus.sendingCode);
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      timeout: Duration(seconds: 60),
      verificationCompleted: (user) {
        this.user = user;
        if (user.displayName != null)
          _controller.sink.add(PhoneAuthStatus.welcome);
        else
          _controller.sink.add(PhoneAuthStatus.displayName);
      },
      verificationFailed: (exception) {
        _controller.add(PhoneAuthStatus.invalidPhoneNumber);
      },
      codeSent: (verificationId, [timeout]) {
        this.verificationId = verificationId;
        _controller.sink.add(PhoneAuthStatus.codeSent);
      },
      codeAutoRetrievalTimeout: (token) {},
    );
  }

  void verifyCode(String otpCode) {
    FirebaseAuth.instance
        .signInWithPhoneNumber(verificationId: verificationId, smsCode: otpCode)
        .then((user) {
      this.user = user;
      if (user.displayName != null)
        _controller.sink.add(PhoneAuthStatus.welcome);
      else
        _controller.sink.add(PhoneAuthStatus.displayName);
    }).catchError((error) {
      _controller.add(PhoneAuthStatus.invalidCode);
    });
  }

  void updateDisplayName(String displayName) {
    _controller.sink.add(PhoneAuthStatus.updatingDisplayName);
    user.updateProfile(UserUpdateInfo()..displayName = displayName).then((_) {
      displayName = displayName;
      _controller.sink.add(PhoneAuthStatus.welcome);
    }).catchError((error) {});
  }

  void dispose() {
    _controller.close();
  }

  void edit() {
    _controller.sink.add(PhoneAuthStatus.initial);
  }
}
