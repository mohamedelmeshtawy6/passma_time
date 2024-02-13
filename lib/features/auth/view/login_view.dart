
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:passma_time/cores/constant/app_colors.dart';
import 'package:passma_time/cores/constant/app_router.dart';
import 'package:passma_time/cores/shared/widgets/custom_button.dart';
import 'package:passma_time/cores/shared/widgets/custom_button_social.dart';
import 'package:passma_time/cores/shared/widgets/custom_text.dart';
import 'package:passma_time/cores/shared/widgets/custom_textfield.dart';
import 'package:passma_time/features/auth/view/signup_view.dart';
import 'package:passma_time/features/auth/viewmodel/cubit/auth_cubit.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: Column(children: [
          Card(
            child: Form(
              key: _key,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CustomText(text: "Welcome", fontSize: 30),
                    GestureDetector(
                      onTap: () {
                     GoRouter.of(context).push(AppRouter.authsignup,);
                       
                      },
                      child: const CustomText(
                          text: "SIGN UP", fontSize: 16, color: AppColors.kgreenprimary),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                  text: "sign in to continuo",
                  fontSize: 14,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  text: 'email',
                  hint: 'moh@gmail.com',
                  onsave: (val) {
         BlocProvider.of<AuthCubit>(context).password = val!;
                  },
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
                  validate:(val)=>BlocProvider.of<AuthCubit>(context).validation(val)
                ),
                const SizedBox(height: 10),
                const CustomText(
                  text: "forget password ?",
                  fontSize: 14,
                  color: Colors.grey,
                  alignment: Alignment.topRight,
                ),
                CustomButton(
                    text: "SIGN IN",
                    onpress: () {
                     
                      if (_key.currentState!.validate()) {
                         _key.currentState!.save();
         BlocProvider.of<AuthCubit>(context).emailPasswordSignIn();
                      }
                    }),
              ]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomText(
            text: "-OR- ",
            alignment: Alignment.center,
          ),
          const SizedBox(
            height: 30,
          ),
          CustomButtonSocial(
            onpress: () {
   BlocProvider.of<AuthCubit>(context).facebookSignIn();
            },
            imageName: "assets/images/facebook.png",
            text: "Sign in with facebook",
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButtonSocial(
            onpress: ()async {
     await   BlocProvider.of<AuthCubit>(context).googleSignIn();
            },
            imageName: "assets/images/google.png",
            text: "Sign in with google",
          )
        ]),
      ),
    );
  }
}
