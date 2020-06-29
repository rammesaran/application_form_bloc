import 'package:application_form_using_bloc/src/blocs/bloc.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  final email = bloc.email;
  final name = bloc.name;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            nameField(),
            emailField(),
            phoneNumber(),
            postApplyingFor(),
            Container(
              margin: EdgeInsets.only(
                top: 25.0,
              ),
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder<String>(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: (value) => bloc.changeEmail(value),
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              errorText: snapshot.error,
              hintText: "Enter email id",
              labelText: "Email id",
            ),
          );
        });
  }

  Widget nameField() {
    return StreamBuilder<String>(
        stream: bloc.name,
        builder: (context, snapshot) {
          return TextField(
           
            onChanged: (value) => bloc.changeName(value),
            decoration: InputDecoration(
              errorText: snapshot.error,
              hintText: "Enter name",
              labelText: "Name",
            ),
          );
        });
  }

Widget phoneNumber(){
  return StreamBuilder<String>(
    stream: bloc.mobileNumber,
    builder: (context, snapshot) {
      return TextField(
        onChanged: (value) => bloc.changeMobile(value),
        keyboardType:TextInputType.phone ,
        decoration: InputDecoration(
            hintText: 'Enter Mobile',
            labelText: 'Mobile',
            errorText: snapshot.error,
        ),
      );
    }
  );
}

Widget postApplyingFor(){
  return TextField(
    decoration: InputDecoration(
      hintText: "Type the post applying",
      labelText: "Post Applying for"
    ),
  );
}
  Widget submitButton() {
    return RaisedButton(
      onPressed: () {
        //print('the value $email and $name');
      },
      child: Text("Submit"),
    );
  }
}
