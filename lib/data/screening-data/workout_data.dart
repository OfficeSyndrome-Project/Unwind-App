class WorkoutList {
  String title;
  String titlePath;
  List<WorkoutData> workoutData;
  WorkoutList({
    required this.title,
    required this.titlePath,
    required this.workoutData,
  });
  @override
  String toString() {
    return 'WorkoutList{title: $title, titlePath: $titlePath, workoutData: $workoutData}';
  }
}

class WorkoutData {
  String title;
  String name;
  String detail;
  int time;
  String thumbnailPath;
  String? videoPath;
  String workoutType;
  List<String>? animationPaths;
  WorkoutData({
    required this.title,
    required this.name,
    required this.detail,
    required this.time,
    required this.thumbnailPath,
    required this.videoPath,
    required this.animationPaths,
    required this.workoutType,
  
  });

  @override
  String toString() {
    return 'WorkoutData{title: $title, name: $name, detail: $detail, time: $time, thumbnailPath: $thumbnailPath, videoPath: $videoPath, animationPaths: $animationPaths}';
  }

  static List<WorkoutData> getWorkoutData() => [
        //คอ-บ่า
        //stretch
        WorkoutData(
          title: "คอ-บ่า",
          name: "ท่าหดคอ กดศีรษะ",
          detail: "ท่าเตรียมตัว",
          time: 20,
          thumbnailPath:
              "lib/assets/images/workout-thumbnail-img/neckch01_80x80.png",
          videoPath: null,
          animationPaths: null,
          workoutType: "stretch"

        ),
        WorkoutData(
          title: "คอ-บ่า",
          name: "ท่ามองรักแร้ กดศีรษะ",
          detail: "ท่าเตรียมตัว",
          time: 20,
          thumbnailPath:
              "lib/assets/images/workout-thumbnail-img/neckth02_80x80.png",
          videoPath: null,
          animationPaths: null,
          workoutType: "stretch"
        ),
        WorkoutData(
          title: "คอ-บ่า",
          name: "ท่าเงยหน้า เอนคอ",
          detail: "ท่าเตรียมตัว",
          time: 20,
          thumbnailPath:
              "lib/assets/images/workout-thumbnail-img/nechch03_80x80.PNG",
          videoPath: null,
          animationPaths: null,
          workoutType: "stretch"
        ),
        //strength
        WorkoutData(
          title: "คอ-บ่า",
          name: "ท่านอนเก็บคาง",
          detail: "ท่าเตรียมตัว",
          time: 20,
          thumbnailPath:
              "lib/assets/images/workout-thumbnail-img/neckth01_80x80.png",
          videoPath: null,
          animationPaths: null,
          workoutType: "strength"
        ),
        WorkoutData(
          title: "คอ-บ่า",
          name: "ท่าดันต้าน-ก้ม",
          detail: "ท่าเตรียมตัว",
          time: 20,
          thumbnailPath:
              "lib/assets/images/workout-thumbnail-img/neckth02_80x80.png",
          videoPath: null,
          animationPaths: null,
          workoutType: "strength"
        ),
        WorkoutData(
          title: "คอ-บ่า",
          name: "ท่าดันต้าน-หัน",
          detail: "ท่าเตรียมตัว",
          time: 20,
          thumbnailPath:
              "lib/assets/images/workout-thumbnail-img/neckth03_80x80.PNG",
          videoPath: null,
          animationPaths: null,
          workoutType: "strength"
        ),
        WorkoutData(
          title: "คอ-บ่า",
          name: "ท่าดันต้าน-เอียง",
          detail: "ท่าเตรียมตัว",
          time: 20,
          thumbnailPath:
              "lib/assets/images/workout-thumbnail-img/neckth04_80x80.PNG",
          videoPath: null,
          animationPaths: null,
          workoutType: "strength"
        ),
        WorkoutData(
          title: "คอ-บ่า",
          name: "ท่าดันต้าน-แหงน",
          detail: "ท่าเตรียมตัว",
          time: 20,
          thumbnailPath:
              "lib/assets/images/workout-thumbnail-img/neckth05_80x80.png",
          videoPath: null,
          animationPaths: null,
          workoutType: "strength"
        ),

        //ไหล่
        //stretch
        WorkoutData(
          title: "ไหล่",
          name: "ท่าดึงศอกด้านหลัง",
          detail: "ท่าเตรียมตัว",
          time: 20,
          thumbnailPath:
              "lib/assets/images/workout-thumbnail-img/shoulder01_80x80.png",
          videoPath: null,
          animationPaths: null,
          workoutType: "stretch"
        ),
        WorkoutData(
          title: "ไหล่",
          name: "ท่าดึงศอกหาลำตัว",
          detail: "ท่าเตรียมตัว",
          time: 20,
          thumbnailPath:
              "lib/assets/images/workout-thumbnail-img/shoulder02_80x80.png",
          videoPath: null,
          animationPaths: null,
          workoutType: "stretch"
        ),
        WorkoutData(
          title: "ไหล่",
          name: "ท่าประสานมือเหยียดแขน",
          detail: "ท่าเตรียมตัว",
          time: 20,
          thumbnailPath:
              "lib/assets/images/workout-thumbnail-img/shoulder03_80x80.png",
          videoPath: null,
          animationPaths: null,
          workoutType: "stretch"
        ),
        //หลัง
        //stretch
        WorkoutData(
          title: "หลัง",
          name: "นอนคว่ำแอ่นหลัง",
          detail: "ท่าเตรียมตัว",
          time: 20,
          thumbnailPath:
              "lib/assets/images/workout-thumbnail-img/shoulder03_80x80.png",
          videoPath: null,
          animationPaths: null,
          workoutType: "stretch"
        ),
        WorkoutData(
          title: "หลัง",
          name: "นอนคว่ำแอ่นหลังเต็มที่",
          detail: "ท่าเตรียมตัว",
          time: 20,
          thumbnailPath:
              "lib/assets/images/workout-thumbnail-img/back01_80x80.png",
          videoPath: null,
          animationPaths: null,
          workoutType: "stretch"
        ),
        WorkoutData(
          title: "หลัง",
          name: "นอนคว่ำแอ่นหลังเต็มที่",
          detail: "ท่าเตรียมตัว",
          time: 20,
          thumbnailPath:
              "lib/assets/images/workout-thumbnail-img/back02_80x80.png",
          videoPath: null,
          animationPaths: null,
          workoutType: "stretch"
        ),
        //strength
        WorkoutData(
          title: "หลัง",
          name: "เกร็งลำตัวด้านข้าง",
          detail: "ท่าเตรียมตัว",
          time: 20,
          thumbnailPath:
              "lib/assets/images/workout-thumbnail-img/backth01_80x80.png",
          videoPath: null,
          animationPaths: null,
          workoutType: "strength"
        ),
      ];
}
