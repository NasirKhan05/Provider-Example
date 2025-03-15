import 'package:flutter/material.dart';

class NotifyListner extends StatelessWidget {
  NotifyListner({super.key});
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    print('Build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Stl As a Stf'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: toggle,
              builder: (context, value, child){
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    obscureText: toggle.value,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: Color(0xffF8F9FA),
                      suffixIcon: InkWell(
                        onTap: (){
                          toggle.value = !toggle.value;
                        },
                          child: Icon(toggle.value ? Icons.visibility_off_outlined : Icons.visibility)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 0.5),
                        borderRadius: BorderRadius.circular(15)

                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15),
                      )
                    ),
                  ),
                );
              }
          ),
          SizedBox(height: 30,),
          Center(
            child: ValueListenableBuilder(
                valueListenable: _counter,
                builder: (context, value, child) {
                  return Text(
                    _counter.value.toString(),
                    style: TextStyle(fontSize: 50),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            _counter.value++;
          },
        child: Icon(Icons.add),
      ),
    );
  }
}
