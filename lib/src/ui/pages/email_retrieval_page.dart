import 'package:checkin/src/ui/components/email_retrieval/check_email_view.dart';
import 'package:checkin/src/ui/components/email_retrieval/insert_email_view.dart';
import 'package:flutter/material.dart';

class EmailRetrievePage extends StatelessWidget {
  final String email;

  const EmailRetrievePage({Key key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: email.isEmpty ? InsertEmailView() : CheckEmailView(email: email),
        ),
      ),
    );
  }
}
