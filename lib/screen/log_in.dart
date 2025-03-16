import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/auth_provider.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ValueNotifier<bool> visible = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Provider APIs',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade500, width: 0.5),
                      borderRadius: BorderRadius.circular(15)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade500, width: 0.5),
                      borderRadius: BorderRadius.circular(15))),
            ),
            SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
                valueListenable: visible,
                builder: (context, value, child){
                  return TextFormField(
                    controller: passwordController,
                    obscureText: visible.value,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        filled: true,
                        fillColor: Colors.grey.shade300,
                        suffixIcon: InkWell(
                            onTap: (){
                              visible.value = !visible.value;
                            },
                            child: Icon(visible.value ? Icons.visibility_off_outlined: Icons.visibility)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade500, width: 0.5),
                            borderRadius: BorderRadius.circular(15)),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.grey.shade500, width: 0.5),
                            borderRadius: BorderRadius.circular(15))),
                  );
                }),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                authProvider.login(emailController.text.toString(),
                passwordController.text.toString());
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: authProvider.loading? CircularProgressIndicator(color: Colors.white,) : Center(
                      child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
