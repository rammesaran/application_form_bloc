import 'dart:async';
import 'validators.dart';


class Bloc extends Validators {
  final _nameController = StreamController<String>.broadcast();
  final _emailController = StreamController<String>.broadcast();
  final _mobileContoller = StreamController<String>.broadcast();


//add data to Stream
  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changeMobile => _mobileContoller.sink.add;

  //retrive data from stream
  Stream<String >get name => _nameController.stream.transform(validateName);
  Stream<String>get email => _emailController.stream.transform(validateEmail);
  Stream<String >get mobileNumber => _mobileContoller.stream.transform(validateMobile);


 void dispose()
  {
    _emailController.close();
    _nameController.close();
    _mobileContoller.close();
  }
} 

final bloc =Bloc();