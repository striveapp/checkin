import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/ui/components/email_retrieval/check_email_view.dart';
import 'package:checkin/src/ui/components/email_retrieval/insert_email_view.dart';
import 'package:checkin/src/ui/components/email_retrieval/wrong_email_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      body: BlocListener<LoginBloc, LoginState>(
        listener: (BuildContext context, LoginState state) {
          if (state is WrongfullyInsertedEmail) {
            showDialog(
              context: context,
              builder: (_) => WrongEmailDialog().build(context),
            );
          }
        },
        child: SafeArea(
          child: Center(
            child: email.isEmpty
                ? InsertEmailView()
                : CheckEmailView(email: email),
          ),
        ),
      ),
    );
  }
}
