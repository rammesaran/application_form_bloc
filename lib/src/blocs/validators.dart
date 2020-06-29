import 'dart:async';

class Validators{
final validateEmail = StreamTransformer<String, String>.fromHandlers(
  handleData: (email, sink)
  {
    if(email.isEmpty){
      sink.addError('Email Id should not be empty');
    }
    else if (email.contains('@')){
      sink.add(email);
    }else{
      sink.addError('Enter validemail');
    }
  }
);

final validateName = StreamTransformer<String, String>.fromHandlers(
  handleData: (name, sink)
  {
    if(name.isEmpty){
      sink.addError('Name  should not be empty');
    }
    else if(name.length > 3){
      sink.add(name);
    }else{
      sink.addError('Enter name');
    }
  }
);

final validateMobile = StreamTransformer<String, String>.fromHandlers(
  handleData: (mobile, sink)
  {
    if(mobile.isEmpty){
      sink.addError('Mobile Number  should not be empty');
    }
    else if(mobile.length > 3){
      sink.add(mobile);
    }else{
      sink.addError('Enter Mobilenumber');
    }
  }
);

}