import 'quizzer_brain.dart';

 class Quizer_bank {
  int _questioncounter=0;
 final List<Quizzer_brain> _question_bank=[
   Quizzer_brain('Some cats are actually allergic to humans', true),
   Quizzer_brain('You can lead a cow down stairs but not up stairs.', false),
   Quizzer_brain('Approximately one quarter of human bones are in the feet.', true),
   Quizzer_brain('A slug\'s blood is green.', true),
   Quizzer_brain('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
   Quizzer_brain('It is illegal to pee in the Ocean in Portugal.', true),
   Quizzer_brain(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
   Quizzer_brain(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
   Quizzer_brain(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
   Quizzer_brain(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
   Quizzer_brain('Google was originally called \"Backrub\".', true),
   Quizzer_brain(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
   Quizzer_brain(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];
  String getQuestionText(){
    return _question_bank[_questioncounter].questiontext;
  }
  bool getAnswerValue(){
    return _question_bank[_questioncounter].questionanswer;
  }
  bool checkQuestionCounter(){
    if(_questioncounter>=_question_bank.length-1)
      {
        return true;
      }
    else{
      return false;
    }
  }
  void nextQuestionCounter()
  {
    _questioncounter++;
  }
  void restQuestionCounter()
  {
    _questioncounter=0;
  }

}