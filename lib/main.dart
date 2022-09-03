import 'package:flutter/material.dart';
import 'quizerbank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Quiz(),
          ),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> scorekeeper=[];
  final Quizer_bank1=new Quizer_bank();
  String alertMsg='Congraulation! \n You Passed ';
  int wrongAnswers=0;
  int rightAnswers=0;
  int totalQuestions=0;


   void chkanswer(bool useranswer){
      setState ( (){
      if (useranswer == Quizer_bank1.getAnswerValue()) {
       rightAnswers++;
        scorekeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        wrongAnswers++;
        scorekeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      if (Quizer_bank1.checkQuestionCounter()) {
        showalert();

      } else {
        Quizer_bank1.nextQuestionCounter();
      }
    });
  }

  void showalert(){
    totalQuestions= rightAnswers+wrongAnswers;
    if(rightAnswers> wrongAnswers){
      Alert(
        context: context,
        type: AlertType.success,
        title: 'Congragulation! You Passed',
        desc: "You have got $rightAnswers/$totalQuestions Scores",
        style: AlertStyle(
          backgroundColor: Colors.grey.shade900,
          titleStyle: TextStyle(
            color: Colors.white,
          ),
          descStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        buttons: [
          DialogButton(
            child: Text(
              "Reset",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }else{
      Alert(
        context: context,
        type: AlertType.warning,
        title: 'Sorry! You Failed',
        desc: "You have got $rightAnswers/$totalQuestions Scores",
        style: AlertStyle(
          backgroundColor: Colors.grey.shade900,
          titleStyle: TextStyle(
            color: Colors.white,
          ),
          descStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        buttons: [
          DialogButton(
            child: Text(
              "Reset",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
    Quizer_bank1.restQuestionCounter();
    scorekeeper = [];
    wrongAnswers=0;
    rightAnswers=0;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                Quizer_bank1.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style:  TextButton.styleFrom( backgroundColor: Colors.green),
              onPressed: (){
                chkanswer(true);
              },
              child: Text(
                'True',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style:  TextButton.styleFrom( backgroundColor: Colors.red),
              onPressed: (){
                chkanswer(false);
              },
              child: Text(
                'False',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}
