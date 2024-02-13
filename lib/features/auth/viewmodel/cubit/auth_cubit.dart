import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:passma_time/cores/constant/app_router.dart';
import 'package:passma_time/cores/services/local_database/shared_prefrence_storage.dart';
import 'package:passma_time/cores/services/serverdatabase/firestore_employee.dart';
import 'package:passma_time/cores/shared/functions/fluttertoast.dart';
import 'package:passma_time/features/auth/data/model/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

 final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FacebookAuth _facebookAuth = FacebookAuth.instance;

 

  late String name, email, password;

  

 

 Future <void> googleSignIn() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication authToken = await googleUser!.authentication;

    final AuthCredential usercredential = GoogleAuthProvider.credential(
        idToken: authToken.idToken, accessToken: authToken.accessToken);

    await _auth.signInWithCredential(usercredential).then((user) async {
      await saveusertofirestore(user);
      emit (LoginGoogleSuccess());
    });
  }

 Future <void> facebookSignIn() async {
    LoginResult loginResult = await _facebookAuth.login(permissions: ['email'],loginBehavior: LoginBehavior.deviceAuth);

    final accessToken = loginResult.accessToken!.token;

    final userCredintial = FacebookAuthProvider.credential(accessToken);
    await _auth.signInWithCredential(userCredintial).then((user) async {
      await saveusertofirestore(user);
    });
  }

  void emailPasswordSignIn() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FirestoreEmployee().getEmployee(value.user!.uid).then((value) async {
          await SharedPrefrenceEmployee.sharedSingleTone.setUser(
              EmployeeModel.fromJson(value.data() as Map<String, dynamic>));
        });
      });
    } catch (e) {
 showMessage('error is :$e');
    }
  }

Future < void> ceateAccountWithemailAndPassword(BuildContext context) async {
  
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
       await saveusertofirestore(user);
        if (user.user!.emailVerified == false) {
          await _auth.currentUser!.sendEmailVerification();

        GoRouter.of(context).pushReplacement(AppRouter.controllerview);
          showMessage('please go to your account and verify it before login');
          
        }
      });
  
    } catch (e) {
      emit(AuthSingUpfail());
        showMessage('error message :$e');
  
    }
  }

 Future<void> saveusertofirestore(UserCredential user) async {
    EmployeeModel model = EmployeeModel(
        id: user.user!.uid,
        email: user.user!.email!,
        name: user.user!.displayName ?? name,
        picture: user.user!.photoURL?? "");

    await FirestoreEmployee().addEmployeeData(model);

    await setUserInShared(model);
  }

  setUserInShared(EmployeeModel model) async {
    await SharedPrefrenceEmployee.sharedSingleTone.setUser(model);
  }




 


String ? validation(String?val){

         if (val == null) {
               showMessage('please enter your data');
                        return "please enter your data";
                      } 
                      else if(val.length<=7){
                         showMessage('please enter more than 8 character');
                        return "please enter more than 8 character";
                      }
                      
                      else {
                        return null;
                      }
                    }




}














