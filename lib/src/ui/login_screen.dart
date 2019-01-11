import 'package:flutter/material.dart';
import '../bloc/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget logoField() {
      return Hero(
        tag: 'hero',
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/comitLogo2.png'),
        ),
      );
    }

    Widget emailField() {
      return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changeEmail,
            autofocus: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'tucorreo@ejemplo.com',
              labelText: 'Correo Electrónico',
              errorText: snapshot.error,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
            ),
          );
        },
      );
    }

    Widget passwordField() {
      return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Contraseña',
              labelText: 'Contraseña',
              errorText: snapshot.error,
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
            ),
          );
        },
      );
    }

    Widget submitButton() {
      return StreamBuilder(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return RaisedButton(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            shape: StadiumBorder(),
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.amber,
            onPressed: snapshot.hasData ? bloc.submit : null,
          );
        },
      );
    }

    return Container(
      
      margin: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          logoField(),
          SizedBox(
            height: 40.0,
          ),
          emailField(),
          SizedBox(
            height: 25.0,
          ),
          passwordField(),
          SizedBox(
            height: 30.0,
          ),
          submitButton(),
        ],
      ),
    );
  }
}
