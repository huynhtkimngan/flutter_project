import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{

  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();

  final TextEditingController emailController =TextEditingController();

  final TextEditingController passwordController =TextEditingController();
  @override
  Widget build(BuildContext context){
    return SafeArea(child:
    Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Color.fromRGBO(229, 96, 96, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                  ),
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/3/3c/Logo_sklepu_odzie%C5%BCowego_4U.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 130, 0, 0),

              height: 700,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(80),
                      topRight: Radius.circular(80)
                  )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Text("Forgot Password",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Text("Input your email, we will send you an instruction to reset your password.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),),

                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Vui lòng nhập Email");
                              }
                              if (!RegExp(
                                  "^[a-zA-Z0-9+_.-]+@[a-z0-9A-Z.-]+.[a-z]")
                                  .hasMatch(value)) {
                                return ("Vui lòng nhập Email hợp lệ");
                              }
                              return null;
                            },
                            onSaved: (value){
                              emailController.text = value!;
                            },
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          ElevatedButton(
                            onPressed: (){
                              if (_formKey.currentState!.validate()) {
                                print("Đăng nhập thành công");
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(229, 96, 96, 1),
                            ),
                            child: InkWell(
                              child: SizedBox(
                                width: 2000,
                                height: 50,
                                child: Center(
                                  child: Text("SEND",

                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,

                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Back to"),

                              Text(" Sign In",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color.fromRGBO(229, 96, 96, 1),)),

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
