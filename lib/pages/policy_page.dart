import 'package:flutter/material.dart';
import 'package:unwind_app/Widgets/responsive_check_widget.dart';
import 'package:unwind_app/globals/theme/appscreen_theme.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppscreenTheme(
      iconButtonStart: IconButton(
          alignment: Alignment.centerLeft,
          onPressed: () {
            Navigator.pop(context);
          },
          padding: const EdgeInsets.all(0),
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
          )),
      textBar: 'ข้อกำหนดและเงื่อนไข',
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Text(
                '\t\t\t\tขอบคุณสำหรับความสนใจแอปพลิเคชัน UNWIND ขอให้ผู้ใช้งานอ่านข้อกำหนดและเงื่อนไขการให้บริหารก่อนที่จะใช้งานแอปพลิเคชันมือถือ UNWIND โดยแอปพลิเคชันให้บริการเกี่ยวกับคำแนะนำทางด้านสุขภาพ',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '\t\t\t\tข้อกำหนดและเงื่อนไขในการใช้บริการของแอปพลิเคชัน UNWIND ทำขึ้นระหว่าง นักศึกษาวิศวกรรมศาสตร์ ภาควิศวกรรมคอมพิวเตอร์ สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง (“ผู้พัฒนา”) ฝ่ายหนึ่ง กับผู้ใช้งานแอปพลิเคชัน (“ผู้ใช้งาน”) ข้อกำหนดและเงื่อนไขฉบับนี้มีวัตถุประสงค์เพื่อแจ้งให้ทราบถึงการใช้แอปพลิเคชัน',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '\t\t\t\tหากผู้ใช้งานไม่ยอมรับข้อกำหนดและเงื่อนไขนี้จะไม่มีสิทธิ์ในการใช้งานแอปพลิเคชัน',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  '1. คำนิยาม',
                  style: TextStyle(
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF484D56),
                  ),
                ),
              ),
              Text(
                'ในข้อกำหนดและเงื่อนไข หรือระหว่างที่ใช้งานแอปพลิเคชัน กำหนดให้คำซึ่งมีความหมายเฉพาะต่อไปนี้มีความหมายดังต่อไปนี้ เว้นแต่เนื้อหาของประโยคจะกำหนดให้เป็นอย่างอื่น',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '1.1 “ออฟฟิศซินโดรม” หมายถึง อาการเจ็บปวดทางระบบกระดูกและกล้ามเนื้อที่พบในผู้ที่ทำงานสำนักงานหรือมีลักษณะการทำงานที่ต้องใช้คอมพิวเตอร์',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '1.2 “แบบทดสอบ” หมายถึง ชุดคำถามที่สร้างขึ้นเพื่อรวบรวมและประมวลข้อมูลมาให้ได้ซึ่งผลลัพธ์ในแอปพลิเคชัน',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '1.3 “ค่าความเจ็บปวด” หมายถึง ตัวเลขที่ได้จากการวัดระดับความปวด 0 ถึง 10 จากไม่มีอาการปวดไปจนถึงมีอาการปวดมากจนทนไม่ได้',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '1.4 “ปรับสภาพแวดล้อมการทำงาน” หมายถึง การปรับลักษณะการนั่งทำงานของผู้ที่มีลักษณะการทำงานที่ต้องใช้คอมพิวเตอร์ให้ถูกต้องตามหลักการยศาสตร์ และ “การยศาสตร์” หมายถึง ลักษณะของการทำงานให้มีประสิทธิภาพ และลดปัจจัยที่ส่งผลต่อสุขภาพของผู้ปฏิบัติงาน ในที่นี้มุ่งเน้นไปที่กายวิภาคศาสตร์',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '1.5 “นาฬิกาจับเวลา” หมายถึง นาฬิกาที่จะส่งการเตือนไปถึงผู้ใช้งานเมื่อครบตามกำหนดเวลาที่ผู้ใช้งานตั้งค่าไว้',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '1.6 “ชุดท่าบริหาร” หมายถึง ชุดของท่าบริหารที่แอปพลิเคชันแนะนำให้กับผู้ใช้งาน และ “ท่าบริหาร” หมายถึง ท่าสำหรับบริหารร่างกาย เพื่อจัดการให้โครงสร้างของร่างกายอยู่ในภาวะสมดุลเสมอด้วยตัวของมันเองซึ่งประกอบไปด้วย ท่ายืดเหยียดกล้ามเนื้อและท่าเพิ่มความแข็งแรงให้กับกล้ามเนื้อ',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  '2. การใช้บริการ',
                  style: TextStyle(
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF484D56),
                  ),
                ),
              ),
              Text(
                '2.1 แอปพลิเคชัน UNWIND เป็นแอปพลิเคชันที่ให้บริการเกี่ยวกับคำแนะนำด้านการดูแลสุขภาพสำหรับผู้ที่ทำงานสำนักงานหรือมีลักษณะการทำงานที่ต้องใช้คอมพิวเตอร์รูปแบบออฟไลน์ (Offline) ซึ่งประกอบไปด้วย',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '(1) แนะนำชุดท่าบริหารสำหรับบรรเทาอาการปวด\n(2) แนะนำการปรับสภาพแวดล้อมการทำงานเพื่อลดโอกาสการเกิดอาการปวด\n(3) นาฬิกาจับเวลาการทำงานเพื่อลดโอกาสการเกิดอาการปวด\n(4) สรุปผลการติดตามอาการปวด\n(5) อื่นๆ ที่อาจเพิ่มเติมในภายหลัง',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '2.2 ผู้ใช้งานตกลงและทราบว่าแอปพลิเคชัน UNWIND เป็นแอปพลิเคชันปริญญานิพนธ์ของนักศึกษาวิศวกรรมศาสตร์ ภาควิศวกรรมคอมพิวเตอร์ สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง มีวัตถุประสงค์เพื่อใช้ในการสำเร็จการศึกษา ไม่ได้เป็นผู้ให้บริการโดยแพทย์ที่ได้รับใบอนุญาตแต่อย่างใด',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '2.3 หลังจากใช้งานแอปพลิเคชันในข้อ 2.1(1), 2.1(2) และ 2.1(4) ผู้ใช้งานจะได้รับคำแนะนำด้านการดูแลสุขภาพ ทั้งนี้คำแนะนำดังกล่าวไม่ใช่ใบรับรองแพทย์แต่ประการใด',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  '3. ความถูกต้องและประสิทธิภาพ',
                  style: TextStyle(
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF484D56),
                  ),
                ),
              ),
              Text(
                '3.1 UNWIND เป็นแอปพลิเคชันที่ให้บริการเกี่ยวกับคำแนะนำทางด้านสุขภาพ โดยนำข้อมูลของผู้ใช้งานประมวลตามหลักการซึ่งอ้างอิงจากวิจัยทางการแพทย์ อย่างไรก็ตาม UNWIND ไม่ได้เป็นผู้ให้บริการโดยแพทย์ที่ได้รับใบอนุญาตและไม่ได้มีไว้เพื่อแทนคำแนะนำทางการแพทย์ระดับมืออาชีพในการวินิจฉัย การรักษาหรือการจัดการความเจ็บป่วยหรือภาวะทางการแพทย์',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '3.2 แบบทดสอบประเมินอาการเจ็บปวด เป็นฟีเจอร์ของ UNWIND ที่คัดกรองโรคและประเมินอาการปวดของผู้ใช้งาน โดยที่จะให้เป็นการคัดกรองโรคว่าอาการปวดของผู้ใช้งานเกิดจากสาเหตุการทำงานใช่หรือไม่ และผู้ใช้งานมีอาการปวดที่บริเวณใดบ้าง เพื่อให้คำแนะนำเป็นชุดท่าบริหารในฟีเจอร์ถัดไป โดยแบบทดสอบดังกล่าวได้ผ่านการทดลองใช้จริงเพื่อประเมินประสิทธิภาพเบื้องต้นแล้ว ทั้งนี้ผลลัพธ์จากแบบทดสอบดังกล่าวไม่ได้มีไว้เพื่อแทนคำแนะนำทางการแพทย์ระดับมืออาชีพในการวินิจฉัย',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '3.3 ผู้พัฒนาไม่รับประกันความถูกต้องแม่นยำเกี่ยวกับการประมวลผล และขอปฏิเสธความรับผิดต่อข้อผิดพลาดหรือการละเว้นใด ๆ หรือความคลาดเคลื่อนจากการใช้งาน UNWIND',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  '4. ข้อตกลงทั่วไป',
                  style: TextStyle(
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF484D56),
                  ),
                ),
              ),
              Text(
                '4.1 ผู้ใช้งานตกลงว่าจะไม่ใช้แอปพลิเคชันเพื่อวัตถุประสงค์อื่นใดนอกเหนือจากวัตถุประสงค์ของแอปพลิเคชันนี้เท่านั้น',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '4.2 ผู้ใช้งานจะไม่กระทำการลอกเลียน แก้ไข แยก วิศวกรรมย้อนกลับหรือเปลี่ยนแปลงแพลตฟอร์มหรือข้อมูลภายในแอปพลิเคชัน',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  '5. ข้อยกเว้นความรับผิดชอบ',
                  style: TextStyle(
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF484D56),
                  ),
                ),
              ),
              Text(
                '5.1 ผู้ใช้งานตกลงและยอมรับว่า ผู้พัฒนาไม่ต้องรับผิดชอบในความเสียหายใดๆ อันเกิดขึ้นแก่ผู้ใช้งานอันเนื่องมาจากการใช้งานแอปพลิเคชัน เว้นแต่เกิดจากผู้พัฒนาจงใจกระทำความผิด หรือประมาทเลินเล่ออย่างร้ายแรง',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '5.2 ผู้ใช้งานตกลงและยอมรับว่า ผู้พัฒนาไม่ต้องรับผิดชอบในความผิดพลาด ความบกพร่อง หรือเหตุขัดข้องในการใช้งาน อันเนื่องมาจากเหตุสุวิสัย หรือเหตุอื่นที่อยู่นอกเหนือการควบคุมของผู้พัฒนา',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  '6. การเก็บรวบรวมและการใช้ข้อมูล',
                  style: TextStyle(
                    fontSize:
                        ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF484D56),
                  ),
                ),
              ),
              Text(
                '6.1 ผู้ใช้งานตกลงและไม่โต้แย้งหากแอปพลิเคชันมีการบันทึกและประมวลข้อมูลสุขภาพของผู้ใช้งาน เช่น ประวัติการประสบอุบัติเหตุ, ข้อมูลการออกกำลังกาย, และข้อมูลทางการแพทย์อื่นๆ ที่เกี่ยวข้องกับสุขภาพของผู้ใช้ เพื่อประโยชน์ในการให้คำแนะนำ',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '6.2 ในการใช้งานแอปพลิเคชันจะมีการเก็บรวบรวมและใช้ข้อมูลส่วนบุคคลของผู้ใช้งาน หรือบุคคลอื่นใดที่ได้มีการผู้ใช้งานแอปพลิเคชัน เพื่อวัตถุประสงค์ในการให้บริการเท่านั้น ทั้งนี้ หากผู้ใช้งานได้มีการให้ข้อมูลส่วนบุคคลของบุคคลอื่น ผู้ใช้งานมีหน้าที่แจ้งให้บุคคลดังกล่าวทราบถึงรายละเอียดการเก็บรวบรวมและการใช้ข้อมูล',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Text(
                '6.3 ภาพรวมข้อมูลส่วนบุคคลในการใช้แอปพลิเคชัน มีดังนี้',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '- ชื่อ',
                      style: TextStyle(
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        color: Color(0xFF646A76),
                      ),
                    ),
                    Text(
                      '- นามสกุล',
                      style: TextStyle(
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        color: Color(0xFF646A76),
                      ),
                    ),
                    Text(
                      '- เพศ',
                      style: TextStyle(
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        color: Color(0xFF646A76),
                      ),
                    ),
                    Text(
                      '- อายุ',
                      style: TextStyle(
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        color: Color(0xFF646A76),
                      ),
                    ),
                    Text(
                      '- น้ำหนัก',
                      style: TextStyle(
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        color: Color(0xFF646A76),
                      ),
                    ),
                    Text(
                      '- ส่วนสูง',
                      style: TextStyle(
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        color: Color(0xFF646A76),
                      ),
                    ),
                    Text(
                      '- อาชีพ',
                      style: TextStyle(
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        color: Color(0xFF646A76),
                      ),
                    ),
                    Text(
                      '- ประวัติการประสบอุบัติเหตุ',
                      style: TextStyle(
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        color: Color(0xFF646A76),
                      ),
                    ),
                    Text(
                      '- ผลตรวจจากแบบทดสอบ',
                      style: TextStyle(
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        color: Color(0xFF646A76),
                      ),
                    ),
                    Text(
                      '- ประวัติการบริหารร่างกาย',
                      style: TextStyle(
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        color: Color(0xFF646A76),
                      ),
                    ),
                    Text(
                      '- ค่าความเจ็บปวด',
                      style: TextStyle(
                        fontSize: ResponsiveCheckWidget.isSmallMobile(context)
                            ? 14
                            : 16,
                        color: Color(0xFF646A76),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '6.4 ขอให้ผู้ใช้งานทราบว่าหากมีการลบข้อมูลแอปพลิเคชันหรือถอนการติดตั้งแอปพลิเคชันไปจากเครื่องมือสื่อสาร ข้อมูลทั้งหมดภายในแอปพลิเคชันจะถูกลบโดยอัตโนมัติทันที ',
                style: TextStyle(
                  fontSize:
                      ResponsiveCheckWidget.isSmallMobile(context) ? 14 : 16,
                  color: Color(0xFF646A76),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
