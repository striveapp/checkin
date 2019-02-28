import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checkin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget   {
  HomePage({Key key, this.title, this.googleSignIn, this.auth})
      : super(key: key);

  final String title;
  final GoogleSignIn googleSignIn;
  final FirebaseAuth auth;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text('Login'),
                onPressed: () {
                  _handleSignIn()
                      .then((FirebaseUser user) => print(user))
                      .catchError((e) => print(e));
                }),
            RaisedButton(
                child: Text('Teams'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Teams()),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class Teams extends StatefulWidget {
  Teams({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TeamListState createState() {
    return _TeamListState();
  }
}

class _TeamListState extends State<Teams> {
  List<String> teams = ['Test team'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teams"),
      ),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          _navigateAndDisplayForm(context);
//        },
        onPressed: _showDialogForm,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('teams').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();

        return ListView(
            children: snapshot.data.documents
                .map((team) => ListTile(
              leading: Icon(Icons.accessible_forward),
              title: Text(team.data['name']),
            ))
                .toList());
      },
    );
//    return ListView(
//        children: teams
//            .map((team) => ListTile(
//                  leading: Icon(Icons.accessible_forward),
//                  title: Text(team),
//                ))
//            .toList());
  }

  _showDialogForm() async {
    final textController = TextEditingController();
    final _teamName = GlobalKey<FormState>();

    final result = await showDialog<String>(
        context: context,
        child: AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: SingleChildScrollView(
            child: Form(
                key: _teamName,
                child: TextFormField(
                  controller: textController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Team name';
                    }
                  },
                  autofocus: true,
                  decoration:
                  InputDecoration(labelText: 'Please enter Team name'),
                )),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            FlatButton(
                onPressed: () {
                  if (_teamName.currentState.validate()) {
//                     If the form is valid, we want to show a Snackbar
                    Firestore.instance
                        .collection('teams')
                        .add({'name': textController.text});
                    Navigator.pop(context, textController.text);
                  }
                },
                child: const Text('Save')),
          ],
        ));

    if (result != null) {
//      setState(() {
//        teams.add("$result");
//      });

      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has typed in using our
            // TextEditingController
            content: Text.rich(
              TextSpan(
                text: 'Team ', // default text style
                children: <TextSpan>[
                  TextSpan(
                      text: '$result',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' created')
                ],
              ),
            ),
          );
        },
      );
    }
  }

  // A method that launches the SelectionScreen and awaits the result from
  // Navigator.pop!
  _navigateAndDisplayForm(BuildContext context) async {
    // Navigator.push returns a Future that will complete after we call
    // Navigator.pop on the Team Creation Screen!
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateTeam()),
    );

    if (result != null) {
      setState(() {
        teams.add("$result");
      });

      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // Retrieve the text the user has typed in using our
            // TextEditingController
            content: Text.rich(
              TextSpan(
                text: 'Team ', // default text style
                children: <TextSpan>[
                  TextSpan(
                      text: '$result',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' created')
                ],
              ),
            ),
          );
        },
      );
    }
  }
}

class CreateTeam extends StatefulWidget {
  CreateTeam({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreateTeamFormState createState() {
    return _CreateTeamFormState();
  }
}

class _CreateTeamFormState extends State<CreateTeam> {
  // Create a global key that will uniquely identify the Form widget and allow
  // us to validate the form
  //
  // Note: This is a GlobalKey<FormState>, not a GlobalKey<MyCustomFormState>!
  final _teamName = GlobalKey<FormState>();
  final textController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _teamName we created above
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Team"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _teamName,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: textController,
                autofocus: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter Team name';
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    // Validate will return true if the form is valid, or false if
                    // the form is invalid.
                    if (_teamName.currentState.validate()) {
                      // If the form is valid, we want to show a Snackbar
                      Navigator.pop(context, textController.text);
                    }
                  },
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
