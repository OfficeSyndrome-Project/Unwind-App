import 'package:unwind_app/services/screening-service/screening_diagnose_service.dart';

class WorkoutList {
  String title;
  String workoutType;
  String titlePath;
  String description;
  String titleCode;
  String? totalTime;
  List<WorkoutData> workoutData;
  WorkoutList({
    required this.title,
    required this.workoutType,
    required this.titlePath,
    required this.workoutData,
    required this.description,
    required this.titleCode,
    this.totalTime,
  });

  static List<String> get allWorkoutListTitles => ["คอ-บ่า", "ไหล่", "หลัง"];

  static List<String> get allWorkoutTypes => ["stretch", "strength"];

  static Map<String, String> get allWorkoutTitlePath => {
        "คอ-บ่า": "lib/assets/images/screeningPart/select_pain_2.png",
        "ไหล่": "lib/assets/images/screeningPart/select_pain_3.png",
        "หลัง": "lib/assets/images/screeningPart/select_pain_5.png",
      };

  // Use for converting from String such as 'neckbaa_ch' to WorkoutList
  static Map<String, WorkoutList> get workoutListFromString => {
        'neckbaa_ch': workoutListFromTitle[WorkoutlistTitle.neckbaa_ch]!,
        'neckbaa_th': workoutListFromTitle[WorkoutlistTitle.neckbaa_th]!,
        'shoulder': workoutListFromTitle[WorkoutlistTitle.shoulder]!,
        'back_ch': workoutListFromTitle[WorkoutlistTitle.back_ch]!,
        'back_th': workoutListFromTitle[WorkoutlistTitle.back_th]!,
      };

  // Use for converting from WorkoutlistTitle to WorkoutList
  static Map<WorkoutlistTitle, WorkoutList> get workoutListFromTitle => {
        WorkoutlistTitle.neckbaa_ch: WorkoutList(
            title: "คอ-บ่า",
            description: "ชุดท่าบริหารคอเพิ่มความยืดหยุ่น",
            workoutType: "stretch",
            titlePath: "lib/assets/images/screeningPart/select_pain_1.png",
            titleCode: "neckbaa_ch",
            workoutData: WorkoutData.getWorkoutData()
                .where((element) =>
                    element.title == "คอ-บ่า" &&
                    element.workoutType == "stretch")
                .toList(),
            totalTime: "4 นาที 10 วินาที"),
        WorkoutlistTitle.neckbaa_th: WorkoutList(
            title: "คอ-บ่า",
            description: "ชุดท่าบริหารคอเพิ่มความแข็งแรง",
            workoutType: "strength",
            titlePath: "lib/assets/images/screeningPart/select_pain_1.png",
            titleCode: "neckbaa_th",
            workoutData: WorkoutData.getWorkoutData()
                .where((element) =>
                    element.title == "คอ-บ่า" &&
                    element.workoutType == "strength")
                .toList(),
            totalTime: "5 นาที 50 วินาที"),
        WorkoutlistTitle.shoulder: WorkoutList(
            title: "ไหล่",
            description: "ชุดท่าบริหารไหล่เพิ่มความยืดหยุ่น",
            workoutType: "stretch",
            titlePath: "lib/assets/images/screeningPart/select_pain_3.png",
            titleCode: "shoulder",
            workoutData: WorkoutData.getWorkoutData()
                .where((element) =>
                    element.title == "ไหล่" && element.workoutType == "stretch")
                .toList(),
            totalTime: "13 นาที 45 วินาที"),
        WorkoutlistTitle.back_ch: WorkoutList(
            title: "หลัง",
            description: "ชุดท่าบริหารหลังเพิ่มความยืดหยุ่น",
            workoutType: "stretch",
            titlePath: "lib/assets/images/screeningPart/select_pain_4.png",
            titleCode: "back_ch",
            workoutData: WorkoutData.getWorkoutData()
                .where((element) =>
                    element.title == "หลัง" && element.workoutType == "stretch")
                .toList(),
            totalTime: "2 นาที 50 วินาที"),
        WorkoutlistTitle.back_th: WorkoutList(
            title: "หลัง",
            description: "ชุดท่าบริหารหลังเพิ่มความแข็งแรง",
            workoutType: "stretch",
            titlePath: "lib/assets/images/screeningPart/select_pain_4.png",
            titleCode: "back_th",
            workoutData: WorkoutData.getWorkoutData()
                .where((element) =>
                    element.title == "หลัง" &&
                    element.workoutType == "strength")
                .toList(),
            totalTime: "40 วินาที"),
      };

  @override
  String toString() {
    return 'WorkoutList{title: $title, titlePath: $titlePath, workoutData: $workoutData}';
  }
}

class WorkoutData {
  String title;
  String name;
  String detail;
  String step;
  int sec;
  int time;
  int? set;
  String thumbnailPath;
  String frequency;
  String? caution;
  String? videoPath;
  String workoutType;
  List<String>? animationPaths;

  WorkoutData({
    required this.title,
    required this.name,
    required this.detail,
    required this.step,
    required this.sec,
    required this.time,
    this.set,
    required this.thumbnailPath,
    required this.frequency,
    this.caution,
    required this.videoPath,
    required this.animationPaths,
    required this.workoutType,
  });

  @override
  String toString() {
    return 'WorkoutData{title: $title, name: $name, time: $sec, thumbnailPath: $thumbnailPath, videoPath: $videoPath, animationPaths: $animationPaths}';
  }

  static List<WorkoutData> getWorkoutData() => [
        //คอ-บ่า
        //stretch
        WorkoutData(
          title: "คอ-บ่า",
          name: "ท่าหดคอ กดศีรษะ",
          detail: "ยืดกล้ามเนื้อคอ",
          step:
              "นั่งหรือยืนหลังตรง ก้มศีรษะลงจนสุด ร่วมกับเก็บคางชิดคอ ใช้มือทั้ง 2 ข้างออกแรงกดศีรษะลง จนกระทั่งรู้สึกตึงที่หลังคอ ค้างไว้นานเป็นเวลา 10 วินาทีแล้วปล่อย",
          sec: 10,
          time: 5,
          set: 3,
          thumbnailPath: "lib/assets/images/workout-thumbnail-img/neckch01.png",
          frequency: "ทำทุกวัน",
          caution: "ยืดให้รู้สึกตึง ไม่ควรยืดจนรู้สึกเจ็บ",
          videoPath: null,
          animationPaths: null,
          workoutType: "stretch",
        ),
        WorkoutData(
            title: "คอ-บ่า",
            name: "ท่าเงยหน้า เอนคอด้านซ้าย",
            detail: "ยืดกล้ามเนื้อบ่า",
            step:
                "ยืดด้านซ้าย นั่งหลังตรง ใช้มือข้างขวายึดกับเก้าอี้ให้นิ่ง เพื่อเกิดแรงดึงมากขึ้น ก้มศีรษะ เอนศีรษะไปทางด้านซ้าย หันหน้าไปทางด้านขวา ใช้มือซ้ายจับศีรษะให้โน้มคอไปทางซ้ายมากขึ้น จนรู้สึกตึงบริเวณบ่าขวาค้างไว้นานเป็นเวลา 10 วินาทีแล้วปล่อย",
            sec: 10,
            time: 5,
            set: 3,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/neckch02_l.png",
            frequency: "ทำทุกวัน",
            caution: "ยืดให้รู้สึกตึง ไม่ควรยืดจนรู้สึกเจ็บ",
            videoPath: null,
            animationPaths: null,
            workoutType: "stretch"),
        WorkoutData(
            title: "คอ-บ่า",
            name: "ท่าเงยหน้า เอนคอด้านขวา",
            detail: "ยืดกล้ามเนื้อบ่า",
            step:
                "ยืดด้านขวา นั่งหลังตรง ใช้มือข้างขวายึดกับเก้าอี้ให้นิ่ง เพื่อเกิดแรงดึงมากขึ้น ก้มศีรษะ เอนศีรษะไปทางด้านขวา หันหน้าไปทางด้านซ้าย ใช้มือซ้ายจับศีรษะให้โน้มคอไปทางขวามากขึ้น จนรู้สึกตึงบริเวณบ่าซ้ายค้างไว้นานเป็นเวลา 10 วินาทีแล้วปล่อย",
            sec: 10,
            time: 5,
            set: 3,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/neckch02_r.png",
            frequency: "ทำทุกวัน",
            caution: "ยืดให้รู้สึกตึง ไม่ควรยืดจนรู้สึกเจ็บ",
            videoPath: null,
            animationPaths: null,
            workoutType: "stretch"),
        WorkoutData(
            title: "คอ-บ่า",
            name: "ท่ามองรักแร้ กดศีรษะ",
            detail: "ยืดกล้ามเนื้อสะบักด้านซ้าย",
            step:
                "นั่งหลังตรง ใช้มือข้างซ้ายยึดกับเก้าอี้ให้นิ่ง เพื่อเกิดแรงดึงมากขึ้น หันหน้าไปทางด้านขวา ก้มศีรษะมองรักแร้ทางด้านขวา ใช้มือซ้ายจับศีรษะ ให้โน้มคอไปทางขวามากขึ้น จนรู้สึกตึงบริเวณสะบักซ้าย ค้างไว้นานเป็นเวลา 10 วินาทีแล้วปล่อย",
            sec: 10,
            time: 5,
            set: 3,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/neckch03_l.png",
            frequency: "ทำทุกวัน",
            caution: "ยืดให้รู้สึกตึง ไม่ควรยืดจนรู้สึกเจ็บ",
            videoPath: null,
            animationPaths: null,
            workoutType: "stretch"),
        WorkoutData(
            title: "คอ-บ่า",
            name: "ท่ามองรักแร้ กดศีรษะ",
            detail: "ยืดกล้ามเนื้อสะบักด้านขวา",
            step:
                "นั่งหลังตรง ใช้มือข้างขวายึดกับเก้าอี้ให้นิ่ง เพื่อเกิดแรงดึงมากขึ้น หันหน้าไปทางด้านซ้าย ก้มศีรษะมองรักแร้ทางด้านซ้าย ใช้มือซ้ายจับศีรษะ ให้โน้มคอไปทางซ้ายมากขึ้น จนรู้สึกตึงบริเวณสะบักขวา ค้างไว้นานเป็นเวลา 10 วินาทีแล้วปล่อย",
            sec: 10,
            time: 5,
            set: 3,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/neckch03_r.png",
            frequency: "ทำทุกวัน",
            caution: "ยืดให้รู้สึกตึง ไม่ควรยืดจนรู้สึกเจ็บ",
            videoPath: null,
            animationPaths: null,
            workoutType: "stretch"),
        //strength
        WorkoutData(
            title: "คอ-บ่า",
            name: "ท่านอนเก็บคาง",
            detail: "เพิ่มความแข็งแรงให้กล้ามเนื้อคอ",
            step:
                "นอนหงาย ชันเข่า เก็บคางชิดอก ยกศีรษะขึ้นจากพื้น ค้างไว้นานเป็นเวลา 5 วินาทีแล้วจึงคลาย",
            sec: 5,
            time: 10,
            set: 1,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/neckth01.png",
            frequency: "ทำวันเว้นวัน",
            caution: "ไม่ควรกลั้นหายใจขณะบริหารซึ่งอาจทำให้เกิดอาการหน้ามืดได้",
            videoPath: null,
            animationPaths: null,
            workoutType: "strength"),
        WorkoutData(
            title: "คอ-บ่า",
            name: "ท่าดันต้าน-ก้ม",
            detail: "เพิ่มความแข็งแรงให้กล้ามเนื้อคอ",
            step:
                "นั่งหรือยืนตัวตรง ใช้ฝ่ามือข้างที่ถนัดดันบริเวณหน้าผาก ให้ลำคอออกแรงต้านหน้าผากไปด้านหน้าสวนทางกับแรงดันจากฝ่ามือ ดันต้านไว้เป็นเวลา 5 วินาทีแล้วจึงคลาย",
            sec: 5,
            time: 10,
            set: 1,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/neckth02.png",
            frequency: "ทำวันเว้นวัน",
            videoPath: null,
            animationPaths: null,
            workoutType: "strength"),
        WorkoutData(
            title: "คอ-บ่า",
            name: "ท่าดันต้าน-หัน ด้านซ้าย",
            detail: "เพิ่มความแข็งแรงให้กล้ามเนื้อคอ",
            step:
                "นั่งหรือยืนโดยหันหน้าตรง ใช้ฝ่ามือซ้ายดันบริเวณใบหน้าด้านซ้าย ให้ลำคอออกแรงหันใบหน้าไปด้านซ้ายสวนทางกับแรงดันจากฝ่ามือ ดันต้านไว้เป็นเวลา 5 วินาทีแล้วจึงคลาย",
            sec: 5,
            time: 10,
            set: 1,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/neckth03_l.png",
            frequency: "ทำวันเว้นวัน",
            videoPath: null,
            animationPaths: null,
            workoutType: "strength"),
        WorkoutData(
            title: "คอ-บ่า",
            name: "ท่าดันต้าน-หัน ด้านขวา",
            detail: "เพิ่มความแข็งแรงให้กล้ามเนื้อคอ",
            step:
                "ด้านขวา นั่งหรือยืนโดยหันหน้าตรง ใช้ฝ่ามือขวาดันบริเวณใบหน้าด้านขวา ให้ลำคอออกแรงหันใบหน้าไปด้านขวาสวนทางกับแรงดันจากฝ่ามือ ดันต้านไว้เป็นเวลา 5 วินาทีแล้วจึงคลาย ในด้านซ้ายให้ทำกลับกัน",
            sec: 5,
            time: 10,
            set: 1,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/neckth03_r.png",
            frequency: "ทำวันเว้นวัน",
            videoPath: null,
            animationPaths: null,
            workoutType: "strength"),

        WorkoutData(
            title: "คอ-บ่า",
            name: "ท่าดันต้าน-เอียง ด้านซ้าย",
            detail: "เพิ่มความแข็งแรงให้กล้ามเนื้อคอ",
            step:
                "นั่งหรือยืนโดยหันหน้าตรง ใช้ฝ่ามือซ้ายดันบริเวณกกหูด้านซ้าย ให้ลำคอออกแรงเอียงหัวไปด้านซ้ายสวนทางกับแรงดันจากฝ่ามือ ดันต้านไว้เป็นเวลา 5 วินาทีแล้วจึงคลาย",
            sec: 5,
            time: 10,
            set: 1,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/neckth04_l.png",
            frequency: "ทำวันเว้นวัน",
            videoPath: null,
            animationPaths: null,
            workoutType: "strength"),
        WorkoutData(
            title: "คอ-บ่า",
            name: "ท่าดันต้าน-เอียง ด้านขวา",
            detail: "เพิ่มความแข็งแรงให้กล้ามเนื้อคอ",
            step:
                "นั่งหรือยืนโดยหันหน้าตรง ใช้ฝ่ามือขวาดันบริเวณกกหูด้านขวา ให้ลำคอออกแรงเอียงหัวไปด้านขวาสวนทางกับแรงดันจากฝ่ามือ ดันต้านไว้เป็นเวลา 5 วินาทีแล้วจึงคลาย",
            sec: 5,
            time: 10,
            set: 1,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/neckth04_r.png",
            frequency: "ทำวันเว้นวัน",
            videoPath: null,
            animationPaths: null,
            workoutType: "strength"),
        WorkoutData(
            title: "คอ-บ่า",
            name: "ท่าดันต้าน-แหงน",
            detail: "เพิ่มความแข็งแรงให้กล้ามเนื้อคอ",
            step:
                "นั่งหรือยืนตัวตรง ใช้ทั้ง 2 มือผสานบริเวณท้ายทอย ให้ลำคอออกแรงต้านหัวไปด้านหลังสวนทางกับแรงดันจากฝ่ามือดันต้านไว้เป็นเวลา 5 วินาทีแล้วจึงคลาย",
            sec: 5,
            time: 10,
            set: 1,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/neckth05.png",
            frequency: "ทำวันเว้นวัน",
            videoPath: null,
            animationPaths: null,
            workoutType: "strength"),

        //ไหล่
        //stretch
        WorkoutData(
            title: "ไหล่",
            name: "ท่าดึงศอกด้านหลัง ด้านซ้าย",
            detail: "ยืดกล้ามเนื้อไหล่",
            step:
                "ยืนตัวตรง งอข้อศอกด้านซ้ายขึ้นเหนือศีรษะ ใช้มือขวาจับข้อศอกด้านซ้าย ค่อย ๆ ออกแรงดึงข้อศอกมาด้านหลังจนรู้สึกตึงบริเวณต้นแขนด้านหลัง ดึงค้างไว้นานเป็นเวลา 10 วินาทีแล้วปล่อย",
            sec: 10,
            time: 15,
            set: 3,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/shoulder01_l.png",
            frequency: "ทำทุกวัน",
            caution: "ยืดให้รู้สึกตึง ไม่ควรยืดจนรู้สึกเจ็บ",
            videoPath: null,
            animationPaths: null,
            workoutType: "stretch"),
        WorkoutData(
            title: "ไหล่",
            name: "ท่าดึงศอกด้านหลัง ด้านขวา",
            detail: "ยืดกล้ามเนื้อไหล่",
            step:
                "ยืนตัวตรง งอข้อศอกด้านขวาขึ้นเหนือศีรษะ ใช้มือซ้ายจับข้อศอกด้านขวา ค่อย ๆ ออกแรงดึงข้อศอกมาด้านหลังจนรู้สึกตึงบริเวณต้นแขนด้านหลัง ดึงค้างไว้นานเป็นเวลา 10 วินาทีแล้วปล่อย",
            sec: 10,
            time: 15,
            set: 3,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/shoulder01_r.png",
            frequency: "ทำทุกวัน",
            caution: "ยืดให้รู้สึกตึง ไม่ควรยืดจนรู้สึกเจ็บ",
            videoPath: null,
            animationPaths: null,
            workoutType: "stretch"),
        WorkoutData(
            title: "ไหล่",
            name: "ท่าดึงศอกหาลำตัว ด้านซ้าย",
            detail: "ยืดกล้ามเนื้อไหล่",
            step:
                "ยืนตัวตรง ยกแขนซ้ายพาดผ่านหน้าอกไปด้านซ้าย ใช้มือขวาจับที่ข้อศอกด้านซ้าย ค่อย ๆ ออกแรงดึงข้อศอกเข้าหาลำตัว ค้างไว้จนรู้สึกตึงบริเวณหัวไหล่และสะบักด้านซ้าย ดึงค้างไว้นานเป็นเวลา 10 วินาทีแล้วปล่อย",
            sec: 10,
            time: 15,
            set: 3,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/shoulder02_l.png",
            frequency: "ทำทุกวัน",
            caution: "ยืดให้รู้สึกตึง ไม่ควรยืดจนรู้สึกเจ็บ",
            videoPath: null,
            animationPaths: null,
            workoutType: "stretch"),
        WorkoutData(
            title: "ไหล่",
            name: "ท่าดึงศอกหาลำตัว ด้านขวา",
            detail: "ยืดกล้ามเนื้อไหล่",
            step:
                "ยืนตัวตรง ยกแขนขวาพาดผ่านหน้าอกไปด้านซ้าย ใช้มือซ้ายจับที่ข้อศอกด้านขวา ค่อย ๆ ออกแรงดึงข้อศอกเข้าหาลำตัว ค้างไว้จนรู้สึกตึงบริเวณหัวไหล่และสะบักด้านขวา ดึงค้างไว้นานเป็นเวลา 10 วินาทีแล้วปล่อย",
            sec: 10,
            time: 15,
            set: 3,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/shoulder02_r.png",
            frequency: "ทำทุกวัน",
            caution: "ยืดให้รู้สึกตึง ไม่ควรยืดจนรู้สึกเจ็บ",
            videoPath: null,
            animationPaths: null,
            workoutType: "stretch"),
        WorkoutData(
            title: "ไหล่",
            name: "ท่าประสานมือเหยียดแขน",
            detail: "ยืดกล้ามเนื้อไหล่",
            step:
                "ยืนตัวตรง ประสานมือไว้ระดับหน้าอก โดยหันฝ่ามือออก เหยียดแขนออกไปข้างหน้าจนรู้สึกตึงบริเวณกล้ามเนื้อหลังส่วนบนและสะบัก ดึงค้างไว้นานเป็นเวลา 15 วินาทีแล้วปล่อย",
            sec: 15,
            time: 15,
            set: 3,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/shoulder03.png",
            frequency: "ทำทุกวัน",
            caution: "ยืดให้รู้สึกตึง ไม่ควรยืดจนรู้สึกเจ็บ",
            videoPath: null,
            animationPaths: null,
            workoutType: "stretch"),
        //หลัง
        //stretch
        WorkoutData(
            title: "หลัง",
            name: "นอนคว่ำแอ่นหลัง",
            detail: "ยืดกล้ามเนื้อหลัง",
            step:
                "นอนคว่ำราบกับพื้น ยันลำตัวช่วงบนขึ้นช้า ๆ โดยที่ศอกและข้อมือวางราบกับพื้น ยันลำตัวค้างไว้นานเป็นเวลา 150  วินาทีแล้วจึงค่อยๆ นอนคว่ำลงเหมือนท่าเริ่มต้น",
            sec: 150,
            time: 1,
            set: 6,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/backch01.png",
            frequency: "ทำทุกวัน",
            caution:
                "ควรหยุดบริหารร่างกายทันที ถ้าอาการปวดแย่ลงทันทีหลังการยืดเหยียด หรือถ้าในขณะยืดเหยียดมีอาการปวดร้าวไปที่ขาใต้ข้อเข่า",
            videoPath: null,
            animationPaths: null,
            workoutType: "stretch"),
        WorkoutData(
            title: "หลัง",
            name: "นอนคว่ำแอ่นหลังเต็มที่",
            detail: "ยืดกล้ามเนื้อหลัง",
            step:
                "นอนคว่ำราบกับพื้น โดยวางมือทั้ง 2 ข้างไว้ใต้ไหล่ ค่อยๆ เหยียดแขนทั้ง 2 ข้างให้ตรงพร้อมกับยันลำตัวช่วงบนขึ้น ยันลำตัวค้างไว้เป็น 2 วินาทีแล้วนอนคว่ำลงเหมือนท่าเริ่มต้น จากนั้นทำซ้ำอีก 9 ครั้ง",
            sec: 2,
            time: 10,
            set: 6,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/backch02.png",
            frequency: "ทำทุกวัน",
            caution:
                "ควรหยุดบริหารร่างกายทันที ถ้าอาการปวดแย่ลงทันทีหลังการยืดเหยียด หรือถ้าในขณะยืดเหยียดมีอาการปวดร้าวไปที่ขาใต้ข้อเข่า",
            videoPath: null,
            animationPaths: null,
            workoutType: "stretch"),
        //strength
        WorkoutData(
            title: "หลัง",
            name: "เกร็งลำตัวด้านข้าง ด้านซ้าย",
            detail: "เพิ่มความแข็งแรงให้กล้ามเนื้อหลัง",
            step:
                "นอนตะแคงทับด้านซ้ายโดยใช้ศอกยันลำตัวช่วงบนไว้ เกร็งลำตัว ยกสะโพกให้พ้นพื้น ให้ลำตัวตรง เกร็งลำตัวไว้เป็นเวลา 2 วินาทีแล้วค่อยๆ วางสะโพกลงบนพื้นเหมือนท่าเริ่มต้น",
            sec: 2,
            time: 10,
            set: 1,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/backth01_l.png",
            frequency: "ทำวันเว้นวัน",
            videoPath: null,
            animationPaths: null,
            workoutType: "strength"),
        WorkoutData(
            title: "หลัง",
            name: "เกร็งลำตัวด้านข้าง ด้านขวา",
            detail: "เพิ่มความแข็งแรงให้กล้ามเนื้อหลัง",
            step:
                "นอนตะแคงทับด้านขวาโดยใช้ศอกยันลำตัวช่วงบนไว้ เกร็งลำตัว ยกสะโพกให้พ้นพื้น ให้ลำตัวตรง เกร็งลำตัวไว้เป็นเวลา 2 วินาทีแล้วค่อยๆ วางสะโพกลงบนพื้นเหมือนท่าเริ่มต้น",
            sec: 2,
            time: 10,
            set: 1,
            thumbnailPath:
                "lib/assets/images/workout-thumbnail-img/backth01_r.png",
            frequency: "ทำวันเว้นวัน",
            videoPath: null,
            animationPaths: null,
            workoutType: "strength"),
      ];
}
