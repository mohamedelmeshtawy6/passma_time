
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:passma_time/cores/constant/app_colors.dart';
import 'package:passma_time/cores/constant/app_router.dart';
import 'package:passma_time/cores/constant/app_textstyles.dart';
import 'package:passma_time/cores/shared/widgets/custom_button.dart';
import 'package:passma_time/cores/shared/widgets/custom_text.dart';
import 'package:passma_time/cores/shared/widgets/custom_textfield.dart';
import 'package:passma_time/features/auth/viewmodel/cubit/auth_cubit.dart';


  class SignupView extends StatelessWidget {
  SignupView({super.key});
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       //   resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
      GoRouter.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
         clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Column(children: [
            
            Card(
              child: Form(
                key: _key,
                child: Column(children: [
                   const CustomText(text: "SIGN UP", fontSize: 30, color: AppColors.kgreenprimary),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                   
                    text: 'name',
                    hint: "mohamed ",
                    onsave: (val) {
                  BlocProvider.of<AuthCubit>(context).name = val!;
                    },
                    validate:(val)=> BlocProvider.of<AuthCubit>(context).validation(val)
                  ),
                  CustomTextField(
                   
                    text: 'email',
                    hint: 'moh@gmail.com',
                   onsave:(val)=> BlocProvider.of<AuthCubit>(context).email=val!,
                    validate:(val)=> BlocProvider.of<AuthCubit>(context).validation(val)
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    obsecure: true,
                    text: 'Password',
                    hint: '***********',
                    onsave: (val) {
                   BlocProvider.of<AuthCubit>(context).password = val!;
                    },
                    validate: (val)=> BlocProvider.of<AuthCubit>(context).validation(val)
                  ),
                  CustomButton(
                      text: "SIGN up",
                      onpress: ()async {
                       
                        if (_key.currentState!.validate()) {
                           _key.currentState!.save();
                           FocusScope.of(context).unfocus();
                  await  BlocProvider.of<AuthCubit>(context).ceateAccountWithemailAndPassword(context);
                        }
                      }),
                ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row( children: [
    
              Text('I have account ',style: AppTextStyles.textStyle18.copyWith(color:AppColors.kblackback )),
              GestureDetector(onTap: () => GoRouter.of(context).push(AppRouter.authlogin),child: Text('SignIn ',style: AppTextStyles.textStyle18.copyWith(color:AppColors.kblue ))),
            ],),
                  const SizedBox(
                    height: 30,
                  ),
           
          ]),
        ),
      ),
    );
  }
}
