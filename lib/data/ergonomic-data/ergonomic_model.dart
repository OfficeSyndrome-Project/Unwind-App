class ErgonomicModel {
  int idCategory;
  int questionOrder;
  String category;
  String question;
  String solution;
  String prevent;
  String imagepath;

  ErgonomicModel({
    required this.idCategory,
    required this.questionOrder,
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
        questionOrder: 1,
        category: "ท่าทาง",
        question: "หลังของคุณตรงเมื่อนั่งหรือไม่ ?",
        solution:
            "คุณควรนั่งตัวตรง ไม่แอ่นหรือค่อมมากจนเกินไป ให้แผ่นหลังแนบชิดกับพนักพิง เพื่อให้น้ำหนักกระจายอย่างเหมาะสม ",
        prevent: "อาการปวดหลังส่วนล่าง",
        imagepath: "lib/assets/images/ergonomic-img/w-1.png"));
    questions.add(ErgonomicModel(
        idCategory: 1,
        questionOrder: 2,
        category: "ท่าทาง",
        question:
            "ต้นขาของคุณขนานกับพื้น (ทำมุม 90-110° ที่สะโพก) เมื่อนั่งหรือไม่ ?",
        solution:
            "คุณควรนั่งให้ต้นขาของคุณขนานกับพื้น เพื่อให้น้ำหนักกระจายอย่างเหมาะสม",
        prevent: "อาการปวดบริเวณเชิงกราน",
        imagepath: "lib/assets/images/ergonomic-img/w-2.png"));
    questions.add(ErgonomicModel(
        idCategory: 1,
        questionOrder: 3,
        category: "ท่าทาง",
        question: "เท้าของคุณวางบนพื้นเต็มเท้าเมื่อคุณนั่งหรือไม่ ?",
        solution:
            "คุณควรวางเท้าราบกับพื้นในขณะนั่งหรือกรณีที่เก้าอี้สูงควรมีที่สำหรับพักเท้า",
        prevent: "การกดทับช่วงต้นขาและ เพิ่มการไหลเวียนเลือดส่วนล่างของร่างกาย",
        imagepath: "lib/assets/images/ergonomic-img/w-3.png"));
    questions.add(ErgonomicModel(
        idCategory: 1,
        questionOrder: 4,
        category: "ท่าทาง",
        question: "มีช่องว่างระหว่างเบาะและหลังเข่าหรือไม่ ?",
        solution: "คุณควรนั่งให้ข้อพับเข่าชิดกับเบาะรองนั่ง ",
        prevent: "บาดเจ็บของเอ็นร้อยหวาย",
        imagepath: "lib/assets/images/ergonomic-img/w-4.png"));
    questions.add(ErgonomicModel(
        idCategory: 1,
        questionOrder: 5,
        category: "ท่าทาง",
        question: "ไหล่ของคุณไม่โก่งหรือยกขึ้นขณะนั่งใช่หรือไม่ ?",
        solution: "ไหล่ของคุณไม่ควรยกขณะทำงาน เพื่อให้บริเวณหัวไหล่ได้ผ่อนคลาย",
        prevent: "อาการปวดหลังส่วนล่าง",
        imagepath: "lib/assets/images/ergonomic-img/w-5.png"));
    questions.add(ErgonomicModel(
        idCategory: 2,
        questionOrder: 1,
        category: "พื้นที่ทำงาน",
        question:
            "แป้นพิมพ์ เมาส์ และอุปกรณ์อื่น ๆ อยู่สูงกว่าระดับข้อศอกของคุณหรือไม่ ?",
        solution:
            "คุณควรวางแป้นพิมพ์ เมาส์หรืออุปกรณ์อื่นๆที่ใช้งานด้วยมือให้อยู่ระดับเดียวข้อศอก เพื่อไม่ให้ไหล่/ข้อศอก/ข้อมือของคุณยกขึ้นขณะใช้งานอุปกรณ์เหล่านั้น",
        prevent: "อาการปวดตามจุดต่าง ๆ จากการเกร็งขณะทำงาน",
        imagepath: "lib/assets/images/ergonomic-img/w-6.png"));
    questions.add(ErgonomicModel(
        idCategory: 2,
        questionOrder: 2,
        category: "พื้นที่ทำงาน",
        question: "แขนของคุณวางขนานกับพื้นขณะพิมพ์ใช่หรือไม่ ?",
        solution: "คุณควรวางแขนบนขนานกับพื้น",
        prevent: "ข้อมืออักเสบ",
        imagepath: "lib/assets/images/ergonomic-img/w-7.png"));
    questions.add(ErgonomicModel(
        idCategory: 2,
        questionOrder: 3,
        category: "พื้นที่ทำงาน",
        question: "ข้อมือของคุณตั้งตรง (ไม่งอขึ้นหรือลง) ขณะพิมพ์ใช่หรือไม่ ?",
        solution: "คุณควรวางข้อมือให้ตั้งตรงไม่งอขึ้นหรือลง",
        prevent: "ข้อมืออักเสบ",
        imagepath: "lib/assets/images/ergonomic-img/w-8.png"));
    questions.add(ErgonomicModel(
        idCategory: 2,
        questionOrder: 4,
        category: "พื้นที่ทำงาน",
        question:
            "เมาส์ของคุณอยู่ในระดับเดียวกัน/ใกล้เคียงกันกับแป้นพิมพ์ ใช่หรือไม่ ?",
        solution: "ตำแหน่งของแป้นพิมพ์และเมาส์ ควรอยู่ในระดับเดียวกัน",
        prevent: "ข้อมืออักเสบ",
        imagepath: "lib/assets/images/ergonomic-img/w-9.png"));
    questions.add(ErgonomicModel(
        idCategory: 2,
        questionOrder: 5,
        category: "พื้นที่ทำงาน",
        question: "คุณใช้ลำโพงหรือหูฟังขณะทำงานหรือไม่ ?",
        solution:
            "คุณควรใช้หูฟัง หากต้องทำงานไปด้วยและใช้โทรศัพท์ร่วมด้วย การถือโทรศัพท์",
        prevent: "-",
        imagepath: "lib/assets/images/ergonomic-img/w-10.png"));
    questions.add(ErgonomicModel(
        idCategory: 2,
        questionOrder: 6,
        category: "พื้นที่ทำงาน",
        question: "คุณมีอุปกรณ์เสริมสำหรับโน้ตบุ๊คหรือไม่ ? เช่น การต่อจอเพิ่ม",
        solution:
            "ควรใช้แป้นพิมพ์และเมาส์ขนาดfull-sized และหากต่อจอเพิ่มควรใช้ที่ตั้งเพื่อเพิ่มความสูงของจอให้พอดีกับระดับสายตา",
        prevent: "-",
        imagepath: "lib/assets/images/ergonomic-img/w-11.png"));
    questions.add(ErgonomicModel(
        idCategory: 3,
        questionOrder: 1,
        category: "หน้าจอ",
        question: "หน้าจอวางอยู่ตรงหน้าของคุณใช่หรือไม่ ?",
        solution:
            "คุณควรวางหน้าจอให้อยู่ตรงหน้าของคุณพอดี เพื่อให้ศีรษะของคุณตั้งตรงให้ขณะทำงานไม่ยื่นหรือไม่เอียงไปด้านใดด้านหนึ่ง",
        prevent: "ปวดบริเวณคอ-บ่า",
        imagepath: "lib/assets/images/ergonomic-img/w-12.png"));
    questions.add(ErgonomicModel(
        idCategory: 3,
        questionOrder: 2,
        category: "หน้าจอ",
        question: "หน้าจอของคุณอยู่ห่างจากคุณไปหนึ่งช่วงแขนใช่หรือไม่ ?",
        solution:
            "คุณควรวางหน้าจอห่างจากสายตาประมาณ 45 - 75 เซนติเมตร โดยจะมีความยาวเท่ากับหนึ่งช่วงแขนของคุณซึ่งมีความยาว 65 - 70 เซนติเมตร(ความยาวช่วงแขนของมนุษย์)",
        prevent: "อาการเมื่อยล้าและปวดตา",
        imagepath: "lib/assets/images/ergonomic-img/w-13.png"));
    questions.add(ErgonomicModel(
        idCategory: 3,
        questionOrder: 3,
        category: "หน้าจอ",
        question: "ความสูงของหน้าจออยู่ต่ำกว่าระดับสายตาเล็กน้อยใช่หรือไม่ ?",
        solution:
            "คุณควรวางหน้าจอให้พอดีหรืออยู่ต่ำกว่าระดับสายตาเล็กน้อย เพื่อให้สายตาขนานกับพื้นหากระดับความสูงของหน้าจอไม่เหมาะสมคุณอาจจะมีการยื่นคอไปด้านหน้าขณะทำงานแล้วทำให้มีอาการปวดบริเวณคอได้",
        prevent: "ปวดบริเวณคอ-บ่า",
        imagepath: "lib/assets/images/ergonomic-img/w-14.png"));
    questions.add(ErgonomicModel(
        idCategory: 4,
        questionOrder: 1,
        category: "แสงสว่าง",
        question: "หน้าจอของคุณไม่มีแสงสะท้อนใช่หรือไม่ ?",
        solution:
            "หากทำงานกับหน้าจอในสภาพแวดล้อมที่มีแสงสะท้อนและจอภาพมีความสว่างมากก็จะส่งผลเสียต่อดวงตา",
        prevent: "อาการปวดร้าวดวงตาและแสบตา",
        imagepath: "lib/assets/images/ergonomic-img/w-15.png"));
    questions.add(ErgonomicModel(
        idCategory: 4,
        questionOrder: 2,
        category: "แสงสว่าง",
        question: "คุณมีแสงที่เหมาะสมสำหรับการอ่านหรือการเขียนใช่หรือไม่ ?",
        solution:
            "หากอ่านหรือเขียนในที่ที่แสงน้อย จะทำให้ทำให้กล้ามเนื้อรอบดวงตาและม่านตาทำงานหนักขึ้นได้ ดังนั้นจึงควรจัดแสงให้พอเหมาะกับการอ่านหรือเขียน",
        prevent: "อาการเมื่อยล้าและปวดตา",
        imagepath: "lib/assets/images/ergonomic-img/w-16.png"));
    questions.add(ErgonomicModel(
        idCategory: 5,
        questionOrder: 1,
        category: "การหยุดพัก",
        question: "พักเบรกจากการทำงานทุก ๆ 1 ชั่วโมงหรือไม่ ?",
        solution:
            "ควรหมั่นพักเบรค อย่างน้อยทุก 1 ชั่วโมงและยืดเส้นยืดสายระหว่างพัก เพื่อใช้งานกล้ามเนื้อ",
        prevent: "บาดเจ็บของกล้ามเนื้อ",
        imagepath: "lib/assets/images/ergonomic-img/w-17.png"));
    questions.add(ErgonomicModel(
        idCategory: 5,
        questionOrder: 2,
        category: "การหยุดพัก",
        question: "พักสายตาจากการมองหน้าจอเป็นประจำหรือไม่ ?",
        solution:
            "แนะนำให้คุณละสายตาจากหน้าจอ หลังจากใช้หน้าจอไปประมาณ 20 นาที มองออกไปไกล ๆ เพื่อให้กล้ามเนื้อตาได้ผ่อยคลาย",
        prevent: "ปวดตา",
        imagepath: "lib/assets/images/ergonomic-img/w-18.png"));
    questions.add(ErgonomicModel(
        idCategory: 6,
        questionOrder: 1,
        category: "โซนทำงาน",
        question: "อุปกรณ์ที่ใช้บ่อยอยู่ในโซนหลัก (Primary Zone) หรือไม่ ?",
        solution:
            "ควรปรับให้อุปกรณ์ที่ใช้บ่อยมาอยู่บริเวณ Primary Zone หรืออยู่ในจุดที่แขนสามารถยืดออกไปโดยศอกยังวางอยู่ข้างตัวเพื่อลดการยืด เอนตัว ",
        prevent: "บาดเจ็บของกล้ามเนื้อ",
        imagepath: "lib/assets/images/ergonomic-img/w-19.png"));

    return questions;
  }
}
