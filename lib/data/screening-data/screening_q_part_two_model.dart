//select part to check
class ScreeningPartTwoSelectPart {
  String title;
  String assetPath;
  List<int> questionPage;
  String questionType;
  int questionPart;
  int partOrder;
  ScreeningPartTwoSelectPart({
    required this.title,
    required this.assetPath,
    required this.questionPage,
    required this.questionType,
    required this.questionPart,
    required this.partOrder,
  });
  static List<ScreeningPartTwoSelectPart> getTitleQPage() => [
        ScreeningPartTwoSelectPart(
          title: "คอ",
          assetPath: 'lib/assets/images/screeningPart/select_pain_1.png',
          questionPage: [1, 2, 3, 4, 5],
          questionType: "a",
          questionPart: 2,
          partOrder: 0,
        ),
        ScreeningPartTwoSelectPart(
          title: "บ่า",
          assetPath: 'lib/assets/images/screeningPart/select_pain_2.png',
          questionPage: [1, 2, 3],
          questionType: "b",
          questionPart: 2,
          partOrder: 1,
        ),
        ScreeningPartTwoSelectPart(
          title: "ไหล่",
          assetPath: 'lib/assets/images/screeningPart/select_pain_3.png',
          questionPage: [1, 2, 3],
          questionType: "b",
          questionPart: 2,
          partOrder: 2,
        ),
        ScreeningPartTwoSelectPart(
          title: "หลังส่วนบน",
          assetPath: 'lib/assets/images/screeningPart/select_pain_4.png',
          questionPage: [1, 2],
          questionType: "a",
          questionPart: 2,
          partOrder: 3,
        ),
        ScreeningPartTwoSelectPart(
          title: "หลังส่วนล่าง",
          assetPath: 'lib/assets/images/screeningPart/select_pain_5.png',
          questionPage: [1, 2],
          questionType: "a",
          questionPart: 2,
          partOrder: 4,
        )
      ];
  @override
  String toString() {
    return 'ScreeningPartTwoSelectPart{title: $title, assetPath: $assetPath, questionPage: $questionPage, questionType: $questionType}';
  }
}

// screening part2 only quesiton
class ScreeningPartTwoQuestionModel {
  String? topic; //หัวข้อคำถาม ex:ความบ่อย,อาการ/ความลึก
  String question;
  int questionPage;
  String questionType;
  int questionPart;
  int questionId;

  ScreeningPartTwoQuestionModel({
    required this.topic,
    required this.question,
    required this.questionPage,
    required this.questionType,
    required this.questionPart,
    required this.questionId,
  });
  static List<ScreeningPartTwoQuestionModel>
      getScreeningPartTwoQuestionModel() => [
            //type a (คำถาม 2 ข้อ)
            ScreeningPartTwoQuestionModel(
                topic: "ความบ่อย",
                question:
                    "1. ท่านมีอาการปวดบริเวณดังกล่าวมากกว่า 1 ครั้งใน 1 วัน ?",
                questionPage: 0,
                questionType: "a",
                questionPart: 2,
                questionId: 1),
            ScreeningPartTwoQuestionModel(
                topic: null,
                question:
                    "2. อาการปวดของท่านไม่เปลี่ยนแปลงระดับความรุนแรงตามช่วงเวลาของวันหรือท่าทางการเคลื่อนไหว ใช่หรือไม่ ?",
                questionPage: 0,
                questionType: "a",
                questionPart: 2,
                questionId: 2),
            //type b (คำถาม 4 ข้อ)
            ScreeningPartTwoQuestionModel(
                topic: "ความบ่อย",
                question:
                    "1. ท่านมีอาการปวดบริเวณดังกล่าวมากกว่า 1 ครั้งใน 1 วัน ?",
                questionPage: 0,
                questionType: "b",
                questionPart: 2,
                questionId: 1),
            ScreeningPartTwoQuestionModel(
                topic: null,
                question:
                    "2. อาการปวดของท่านไม่เปลี่ยนแปลง\nระดับความรุนแรงตามช่วงเวลาของวัน\nหรือท่าทางการเคลื่อนไหว ใช่หรือไม่ ?",
                questionPage: 0,
                questionType: "b",
                questionPart: 2,
                questionId: 2),
            ScreeningPartTwoQuestionModel(
                topic: "อาการ/ความลึก",
                question:
                    "3.ท่านมีอาการปวดลักษณะตื้อ ๆ ตึง ๆ ที่\nบริเวณดังกล่าวใช่หรือไม่ ?",
                questionPage: 1,
                questionType: "b",
                questionPart: 2,
                questionId: 3),
            ScreeningPartTwoQuestionModel(
                topic: "อาการ/ความลึก",
                question:
                    "4.อาการปวดของท่านมีลักษณะ\nใกล้เคียงกับข้อใดมากที่สุด ?",
                questionPage: 2,
                questionType: "b",
                questionPart: 2,
                questionId: 4),
          ];
  @override
  String toString() {
    return 'ScreeningPartTwoQuestionModel{topic: $topic, question: $question, questionPage: $questionPage, questionType: $questionType, questionId: $questionId}';
  }
}

// screening part2 check by posture
class ScreeningPartTwoPostureModel {
  String title;
  String postureName; //ชื่อท่า
  String assetPath;
  String question;
  int questionPage;
  String questionType;
  int questionPart;
  int questionId;

  ScreeningPartTwoPostureModel({
    required this.title,
    required this.postureName,
    required this.assetPath,
    required this.question,
    required this.questionPage,
    required this.questionType,
    required this.questionPart,
    required this.questionId,
  });

  static List<ScreeningPartTwoPostureModel> getScreeningPartTwoPostureModel() =>
      [
        ScreeningPartTwoPostureModel(
            title: "คอ",
            postureName: "ท่าเส้นประสาทคอที่ 1 ULNT 1",
            assetPath: "lib/assets/images/screeningPart/ulnt1.png",
            question:
                "เมื่อท่านทำท่าทางดังกล่าว\nท่านมีอาการปวดเพิ่มขึ้น หรือปวดแสบร้อน หรือไม่ ?",
            questionPage: 0,
            questionType: "a",
            questionPart: 2,
            questionId: 3),
        ScreeningPartTwoPostureModel(
            title: "คอ",
            postureName: "ท่าเส้นประสาทคอที่ 2 ULNT 2",
            assetPath: "lib/assets/images/screeningPart/ulnt2.png",
            question:
                "เมื่อท่านทำท่าทางดังกล่าว\nท่านมีอาการปวดเพิ่มขึ้น หรือปวดแสบร้อน หรือไม่ ?",
            questionPage: 1,
            questionType: "a",
            questionPart: 2,
            questionId: 4),
        ScreeningPartTwoPostureModel(
            title: "คอ",
            postureName: "ท่าเส้นประสาทคอที่ 3 ULNT ULNAR",
            assetPath: "lib/assets/images/screeningPart/ulnt_ulnar.png",
            question:
                "เมื่อท่านทำท่าทางดังกล่าว\nท่านมีอาการปวดเพิ่มขึ้น หรือปวดแสบร้อน หรือไม่ ?",
            questionPage: 2,
            questionType: "a",
            questionPart: 2,
            questionId: 5),
        ScreeningPartTwoPostureModel(
            title: "คอ",
            postureName: "ท่าเส้นประสาทคอที่ 4 ULNT RADIAL",
            assetPath: "lib/assets/images/screeningPart/ulnt_radial.png",
            question:
                "เมื่อท่านทำท่าทางดังกล่าว\nท่านมีอาการปวดเพิ่มขึ้น หรือปวดแสบร้อน หรือไม่ ?",
            questionPage: 3,
            questionType: "a",
            questionPart: 2,
            questionId: 6),
        ScreeningPartTwoPostureModel(
            title: "หลังส่วนบน",
            postureName: "ท่าเส้นประสาทหลังที่ 1 SELF SLUMPER",
            assetPath: "lib/assets/images/screeningPart/self_slumper.png",
            question:
                "เมื่อท่านทำท่าทางดังกล่าว\nท่านมีอาการปวดเพิ่มขึ้น หรือปวดแสบร้อน หรือไม่ ?",
            questionPage: 0,
            questionType: "a",
            questionPart: 2,
            questionId: 3),
        ScreeningPartTwoPostureModel(
            title: "หลังส่วนล่าง",
            postureName: "ท่าเส้นประสาทหลังที่ 1 SELF SLUMPER",
            assetPath: "lib/assets/images/screeningPart/self_slumper.png",
            question:
                "เมื่อท่านทำท่าทางดังกล่าว\nท่านมีอาการปวดเพิ่มขึ้น หรือปวดแสบร้อน หรือไม่ ?",
            questionPage: 0,
            questionType: "a",
            questionPart: 2,
            questionId: 3),
      ];
  @override
  String toString() {
    return 'ScreeningPartTwoPostureModel{title: $title, postureName: $postureName, assetPath: $assetPath, question: $question, questionPage: $questionPage, questionType: $questionType, questionId: $questionId}';
  }
}

//composite class
class ScreeningPartTwoModel {
  ScreeningPartTwoModel({
    required this.selectedPart,
    required this.questions,
    required this.postures,
  });
  ScreeningPartTwoSelectPart selectedPart;
  List<ScreeningPartTwoQuestionModel> questions;
  List<ScreeningPartTwoPostureModel> postures;

  @override
  String toString() {
    return "$selectedPart, $questions, $postures";
  }

  static void sortByPartOrder(List<ScreeningPartTwoModel> list) {
    list.sort(
        (a, b) => a.selectedPart.partOrder.compareTo(b.selectedPart.partOrder));
  }
}
