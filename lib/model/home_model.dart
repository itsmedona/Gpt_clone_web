class HomeModel {
  final String question;
  final String answer;

  const HomeModel({required this.question, required this.answer});
  toJson(){
    return {
      "Question": question,
      "Answer": answer,
    };
  }
}
