class Answer {
  final int QuestionPart;
  final String? title;
  final int questionID;
  final int answer;

  const Answer({
    required this.QuestionPart,
    required this.title,
    required this.questionID,
    required this.answer,
  });
}

class ShowGoToDoctorPageService {
  static final List<Answer> shouldSeeDoctor = [
    //yes = 1 , no = 2
    //part 1
    Answer(QuestionPart: 1, title: null, questionID: 1, answer: 2),
    Answer(QuestionPart: 1, title: null, questionID: 2, answer: 1),
    Answer(QuestionPart: 1, title: null, questionID: 3, answer: 1),
    Answer(QuestionPart: 1, title: null, questionID: 4, answer: 1),
    //part 2
    Answer(QuestionPart: 2, title: "คอ", questionID: 2, answer: 1),
    Answer(QuestionPart: 2, title: "คอ", questionID: 3, answer: 1),
    Answer(QuestionPart: 2, title: "คอ", questionID: 4, answer: 1),
    Answer(QuestionPart: 2, title: "คอ", questionID: 5, answer: 1),
    Answer(QuestionPart: 2, title: "คอ", questionID: 6, answer: 1),
    Answer(QuestionPart: 2, title: "บ่า", questionID: 2, answer: 1),
    Answer(QuestionPart: 2, title: "บ่า", questionID: 4, answer: 3),
    Answer(QuestionPart: 2, title: "บ่า", questionID: 4, answer: 3),
    Answer(QuestionPart: 2, title: "ไหล่", questionID: 2, answer: 1),
    Answer(QuestionPart: 2, title: "ไหล่", questionID: 4, answer: 3),
    Answer(QuestionPart: 2, title: "ไหล่", questionID: 4, answer: 3),
    Answer(QuestionPart: 2, title: "หลังส่วนบน", questionID: 2, answer: 1),
    Answer(QuestionPart: 2, title: "หลังส่วนบน", questionID: 3, answer: 1),
    Answer(QuestionPart: 2, title: "หลังส่วนล่าง", questionID: 2, answer: 1),
    Answer(QuestionPart: 2, title: "หลังส่วนล่าง", questionID: 3, answer: 1),
    //part 3
    Answer(QuestionPart: 3, title: "คอ", questionID: 2, answer: 1),
    Answer(QuestionPart: 3, title: "คอ", questionID: 3, answer: 1),
    Answer(QuestionPart: 3, title: "คอ", questionID: 4, answer: 2),
    Answer(QuestionPart: 3, title: "บ่า", questionID: 2, answer: 1),
    Answer(QuestionPart: 3, title: "บ่า", questionID: 3, answer: 1),
    Answer(QuestionPart: 3, title: "บ่า", questionID: 4, answer: 2),
    Answer(QuestionPart: 3, title: "หลังส่วนบน", questionID: 2, answer: 1),
    Answer(QuestionPart: 3, title: "หลังส่วนบน", questionID: 3, answer: 1),
    Answer(QuestionPart: 3, title: "หลังส่วนบน", questionID: 4, answer: 2),
  ];

  static bool showGoToDoctorPage(
      int questionPart, String? title, int questionID, int answer) {
    return shouldSeeDoctor
        .where((element) => element.QuestionPart == questionPart)
        .where((element) => element.title == title)
        .where((element) => element.questionID == questionID)
        .where((element) => element.answer == answer)
        .isNotEmpty;
  }
}

class ScreeningDiagnoseService {
  
}
