class ErgonomicModel {
  int idCategory;
  String category;
  String question;
  String solution;
  String prevent;
  String imagepath;

  ErgonomicModel({
    required this.idCategory,
    required this.category,
    required this.question,
    required this.solution,
    required this.prevent,
    required this.imagepath,
  });

  static List<ErgonomicModel> getQuestion() {
    List<ErgonomicModel> questions = [];

    questions.add(ErgonomicModel(
        idCategory: 1,
        category: "ท่าทาง",
        question: "หลังของคุณตรงเมื่อนั่งหรือไม่ ?",
        solution:
            "คุณควรนั่งตัวตรง\nไม่แอ่นหรือค่อมมากจนเกินไป\nให้แผ่นหลังแนบชิดกับพนักพิง\nเพื่อให้น้ำหนักกระจายอย่างเหมาะสม ",
        prevent: "อาการปวดหลังส่วนล่าง",
        imagepath: "lib/assets/images/w-1.png"));
    questions.add(ErgonomicModel(
        idCategory: 1,
        category: "ท่าทาง",
        question:
            "ต้นขาของคุณขนานกับพื้น\n(ทำมุม 90-110° ที่สะโพก) เมื่อนั่งหรือไม่ ?",
        solution:
            "คุณควรนั่งให้ต้นขาของคุณขนานกับพื้น\nเพื่อให้น้ำหนักกระจายอย่างเหมาะสม",
        prevent: "อาการปวดบริเวณเชิงกราน",
        imagepath: "lib/assets/images/w-2.png"));
    questions.add(ErgonomicModel(
        idCategory: 1,
        category: "ท่าทาง",
        question: "เท้าของคุณวางบนพื้นเต็มเท้าเมื่อคุณนั่งหรือไม่ ?",
        solution:
            "คุณควรวางเท้าราบกับพื้นในขณะนั่งหรือ\nกรณีที่เก้าอี้สูงควรมีที่สำหรับพักเท้า",
        prevent: "การกดทับช่วงต้นขาและ เพิ่มการไหลเวียนเลือดส่วนล่างของร่างกาย",
        imagepath: "lib/assets/images/w-3.png"));
    questions.add(ErgonomicModel(
        idCategory: 1,
        category: "ท่าทาง",
        question: "มีช่องว่างระหว่างเบาะและหลังเข่าหรือไม่ ?",
        solution: "คุณควรนั่งให้ข้อพับเข่าชิดกับเบาะรองนั่ง ",
        prevent: "บาดเจ็บของเอ็นร้อยหวาย",
        imagepath: "lib/assets/images/w-4.png"));
    questions.add(ErgonomicModel(
        idCategory: 1,
        category: "ท่าทาง",
        question: "ไหล่ของคุณไม่โก่งหรือยกขึ้นขณะนั่งใช่หรือไม่ ?",
        solution:
            "ไหล่ของคุณไม่ควรยกขณะทำงาน\nเพื่อให้บริเวณหัวไหล่ได้ผ่อนคลาย",
        prevent: "อาการปวดหลังส่วนล่าง",
        imagepath: "lib/assets/images/w-5.png"));
    questions.add(ErgonomicModel(
        idCategory: 2,
        category: "พื้นที่ทำงาน",
        question:
            "แป้นพิมพ์ เมาส์ และอุปกรณ์อื่น ๆ\nอยู่สูงกว่าระดับข้อศอกของคุณหรือไม่ ?",
        solution:
            "คุณควรวางแป้นพิมพ์ เมาส์\nหรืออุปกรณ์อื่นๆที่ใช้งานด้วยมือให้อยู่ระดับเดียวข้อศอก\nเพื่อไม่ให้ไหล่/ข้อศอก/ข้อมือของคุณ\nยกขึ้นขณะใช้งานอุปกรณ์เหล่านั้น",
        prevent: "อาการปวดตามจุดต่าง ๆ จากการเกร็งขณะทำงาน",
        imagepath: "lib/assets/images/w-6.png"));
    questions.add(ErgonomicModel(
        idCategory: 2,
        category: "พื้นที่ทำงาน",
        question: "แขนของคุณวางขนานกับพื้นขณะพิมพ์ใช่หรือไม่ ?",
        solution: "คุณควรวางแขนบนขนานกับพื้น",
        prevent: "ข้อมืออักเสบ",
        imagepath: "lib/assets/images/w-7.png"));
    questions.add(ErgonomicModel(
        idCategory: 2,
        category: "พื้นที่ทำงาน",
        question: "ข้อมือของคุณตั้งตรง (ไม่งอขึ้นหรือลง)\nขณะพิมพ์ใช่หรือไม่ ?",
        solution: "คุณควรวางข้อมือให้ตั้งตรงไม่งอขึ้นหรือลง",
        prevent: "ข้อมืออักเสบ",
        imagepath: "lib/assets/images/w-8.png"));
    questions.add(ErgonomicModel(
        idCategory: 2,
        category: "พื้นที่ทำงาน",
        question:
            "เมาส์ของคุณอยู่ในระดับเดียวกัน/ใกล้เคียงกัน\nกับแป้นพิมพ์ ใช่หรือไม่ ?",
        solution: "ตำแหน่งของแป้นพิมพ์และเมาส์ ควรอยู่ในระดับเดียวกัน",
        prevent: "ข้อมืออักเสบ",
        imagepath: "lib/assets/images/w-9.png"));
    questions.add(ErgonomicModel(
        idCategory: 2,
        category: "พื้นที่ทำงาน",
        question: "คุณใช้ลำโพงหรือหูฟังขณะทำงานหรือไม่ ?",
        solution: "",
        prevent: "",
        imagepath: "lib/assets/images/w-10.png"));
    questions.add(ErgonomicModel(
        idCategory: 2,
        category: "พื้นที่ทำงาน",
        question:
            "คุณมีอุปกรณ์เสริมสำหรับโน้ตบุ๊คหรือไม่ ?\nเช่น การต่อจอเพิ่ม",
        solution: "",
        prevent: "",
        imagepath: "lib/assets/images/w-11.png"));
    questions.add(ErgonomicModel(
        idCategory: 3,
        category: "หน้าจอ",
        question: "หน้าจอวางอยู่ตรงหน้าของคุณใช่หรือไม่ ?",
        solution:
            "คุณควรวางหน้าจอให้อยู่ตรงหน้าของคุณพอดี\nเพื่อให้ศีรษะของคุณตั้งตรงให้ขณะทำงาน\nไม่ยื่นหรือไม่เอียงไปด้านใดด้านหนึ่ง",
        prevent: "ปวดบริเวณคอ-บ่า",
        imagepath: "lib/assets/images/w-12.png"));
    questions.add(ErgonomicModel(
        idCategory: 3,
        category: "หน้าจอ",
        question: "หน้าจอของคุณอยู่ห่างจากคุณไปหนึ่งช่วงแขน\nใช่หรือไม่ ?",
        solution:
            "คุณควรวางหน้าจอห่างจากสายตาประมาณ 45 - 75 เซนติเมตร\nโดยจะมีความยาวเท่ากับหนึ่งช่วงแขนของคุณซึ่งมีความยาว 65 - 70 เซนติเมตร\n(ความยาวช่วงแขนของมนุษย์)",
        prevent: "อาการเมื่อยล้าและปวดตา",
        imagepath: "lib/assets/images/w-13.png"));
    questions.add(ErgonomicModel(
        idCategory: 3,
        category: "หน้าจอ",
        question: "ความสูงของหน้าจออยู่ต่ำกว่าระดับสายตาเล็กน้อย\nใช่หรือไม่ ?",
        solution:
            "คุณควรวางหน้าจอให้พอดีหรืออยู่ต่ำกว่าระดับสายตาเล็กน้อย\nเพื่อให้สายตาขนานกับพื้น หากระดับความสูงของหน้าจอไม่เหมาะสม\nคุณอาจจะมีการยื่นคอไปด้านหน้าขณะทำงาน\nแล้วทำให้มีอาการปวดบริเวณคอได้",
        prevent: "ปวดบริเวณคอ-บ่า",
        imagepath: "lib/assets/images/w-14.png"));
    questions.add(ErgonomicModel(
        idCategory: 4,
        category: "แสงสว่าง",
        question: "หน้าจอของคุณไม่มีแสงสะท้อนใช่หรือไม่ ?",
        solution:
            "หากทำงานกับหน้าจอในสภาพแวดล้อม\nที่มีแสงสะท้อนและจอภาพมีความสว่างมาก\nก็จะส่งผลเสียต่อดวงตา",
        prevent: "อาการปวดร้าวดวงตาและแสบตา",
        imagepath: "lib/assets/images/w-15.png"));
    questions.add(ErgonomicModel(
        idCategory: 4,
        category: "แสงสว่าง",
        question: "คุณมีแสงที่เหมาะสมสำหรับการอ่านหรือการเขียนใช่หรือไม่ ?",
        solution:
            "หากอ่านหรือเขียนในที่ที่แสงน้อย จะทำให้ทำให้กล้ามเนื้อรอบดวงตา\nและม่านตาทำงานหนักขึ้นได้ ดังนั้น\nจึงควรจัดแสงให้พอเหมาะกับการอ่านหรือเขียน",
        prevent: "อาการเมื่อยล้าและปวดตา",
        imagepath: "lib/assets/images/w-16.png"));
    questions.add(ErgonomicModel(
        idCategory: 5,
        category: "การหยุดพัก",
        question: "พักเบรกจากการทำงานทุก ๆ 1 ชั่วโมงหรือไม่ ?",
        solution:
            "ควรหมั่นพักเบรค อย่างน้อยทุก 1 ชั่วโมง\nและยืดเส้นยืดสายระหว่างพัก เพื่อใช้งานกล้ามเนื้อ",
        prevent: "บาดเจ็บของกล้ามเนื้อ",
        imagepath: "lib/assets/images/w-17.png"));
    questions.add(ErgonomicModel(
        idCategory: 5,
        category: "การหยุดพัก",
        question: "พักสายตาจากการมองหน้าจอเป็นประจำหรือไม่ ?",
        solution:
            "แนะนำให้คุณละสายตาจากหน้าจอ หลังจากใช้หน้าจอไปประมาณ 20 นาที\nมองออกไปไกล ๆ เพื่อให้กล้ามเนื้อตาได้ผ่อยคลาย",
        prevent: "ปวดตา",
        imagepath: "lib/assets/images/w-18.png"));
    questions.add(ErgonomicModel(
        idCategory: 6,
        category: "โซนทำงาน",
        question: "อุปกรณ์ที่ใช้บ่อยอยู่ในโซนหลัก (Primary Zone)\nหรือไม่ ?",
        solution:
            "ควรปรับให้อุปกรณ์ที่ใช้บ่อยมาอยู่บริเวณ Primary Zone\nหรืออยู่ในจุดที่แขนสามารถยืดออกไปโดยศอกยังวางอยู่ข้างตัว\nเพื่อลดการยืด เอนตัว ",
        prevent: "บาดเจ็บของกล้ามเนื้อ",
        imagepath: "lib/assets/images/w-19.png"));

    return questions;
  }
}
