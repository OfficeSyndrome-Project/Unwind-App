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

  @override
  String toString() {
    return 'Answer{QuestionPart: $QuestionPart, title: $title, questionID: $questionID, answer: $answer}';
  }
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

enum ScreeningTitle { neck, baa, shoulder, lowerback, upperback }

enum WorkoutlistTitle { neckbaa, shoulder, back }

class ScreeningDiagnoseService {
  //function for check condition of nrs
  static bool NRSlessthan8(int NRS) {
    return NRS.abs() < 8;
  }

  //function to convert neck and baa to neckbaa, shoulder to shoulder, lowerback and upperback to back
  static WorkoutlistTitle convertToWorkoutlistTittle(ScreeningTitle title) {
    if (title == ScreeningTitle.neck || title == ScreeningTitle.baa) {
      return WorkoutlistTitle.neckbaa;
    }
    if (title == ScreeningTitle.shoulder) {
      return WorkoutlistTitle.shoulder;
    }
    if (title == ScreeningTitle.lowerback ||
        title == ScreeningTitle.upperback) {
      return WorkoutlistTitle.back;
    }
    throw Exception("title is not in ScreeningTitle");
  }

  static diagnose(List<Answer> answers, Map<ScreeningTitle, int?> nrs) {
    //dictionary Title.part to thai string
    final toThai = {
      ScreeningTitle.neck: "คอ",
      ScreeningTitle.baa: "บ่า",
      ScreeningTitle.shoulder: "ไหล่",
      ScreeningTitle.lowerback: "หลังส่วนล่าง",
      ScreeningTitle.upperback: "หลังส่วนบน",
    };

    List<WorkoutlistTitle> workoutList = [];
    //loop nrs ทีละอัน
    nrs.forEach((key, value) {
      //check if nrs is null then cancel this part
      if (value == null) {
        return;
      }
      //filter nrs by checkNRS (if nrs>=8 then cancel this part)
      if (NRSlessthan8(value)) {
        print("key : $key , value : $value");
        //filter answers by title (which is nrs < 8)
        final ans_of_title =
            answers.where((element) => element.title == toThai[key]).toList();
        print(ans_of_title);

        ans_of_title.forEach((element) {
          //filter gotodoctor
          if (ShowGoToDoctorPageService.showGoToDoctorPage(element.QuestionPart,
              element.title, element.questionID, element.answer)) {
            print("key : $key , value : $value");
            print("element : $element");
            return;
          }
          //give workout list
          workoutList.add(convertToWorkoutlistTittle(key));
        });
      }
    });

    // workoutList
    //เขียนลง db , ใส่ timestamp  
    //ดึง constant model ด้วย 1 ในคอลัมน์ของ db (workoutList title
    //Date ชุดท่า times

    //write workoutdata and timestamp to db (insert)
  }

}

//เก็บคำตอบลง ่history