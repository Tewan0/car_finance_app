// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, sort_child_properties_last, prefer_is_empty

import 'package:flutter/material.dart';

class ShowUICarFn extends StatefulWidget {
  const ShowUICarFn({super.key});

  @override
  State<ShowUICarFn> createState() => _ShowUICarFnState();
}

class _ShowUICarFnState extends State<ShowUICarFn> {
  int _selectedPercent = 0;
  int? _selectedValue;

  TextEditingController priceCtrl = TextEditingController();
  TextEditingController interestCtrl = TextEditingController();

  // สร้างฟังก์ชัน คำนวณค่างวดต่อเดือน
  calculateFinance() {
    // เงื่อนไขตรวจค่าที่กรอกและโชว์ผลลัพธ์
    if (priceCtrl.text.isEmpty ||
        priceCtrl.text == '0.00' ||
        priceCtrl.text == '0') {
      showResultDialog(context, 'คำเตือน', 'ราคารถห้ามว่าง และห้ามเป็น 0');
    } else if (interestCtrl.text.isEmpty ||
        interestCtrl.text == '0.00' ||
        interestCtrl.text == '0') {
      showResultDialog(context, 'คำเตือน', 'ดอกเบี้ยห้ามว่าง และห้ามเป็น 0');
    } else {
      // ตัวแปรเพื่อเก็บค่าราคารถและดอกเบึ้ย
      double carPrice = double.parse(priceCtrl.text);
      double interestRate = double.parse(interestCtrl.text) / 100;

      // คำนวณเงินดาวน์
      double downPayment = (_selectedPercent / 100) * carPrice;
      // คำนวณยอดไฟแนนซ์
      double financeAmount = carPrice - downPayment;
      // คำนวณจำนวนเงินดอกเบี้ย
      double interestAmount =
          (financeAmount * interestRate / 100) * _selectedValue!;
      // คำนวณค่างวดต่อเดือน
      double monthlyPayment =
          (financeAmount + interestAmount) / _selectedValue!;

      // แสดงผลลัพธ์
      showResultDialog(
        context,
        'ค่างวดต่อเดือน',
        monthlyPayment.toStringAsFixed(2),
      );
    }
  }

  showResultDialog(context, title, message) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(color: Colors.blue, fontSize: 20),
        ),
        content: Text(
          message + ' บาท',
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
            child: Text(
              'ตกลง',
              style: TextStyle(color: Colors.blue, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[500],
        toolbarHeight: 65,
        title: Text(
          'Car Finance App',
          style: TextStyle(
            fontSize: 23,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/car.png',
                  width: 250,
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ราคารถ/บาท',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: priceCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนเงินดาวน์/เปอร์เซ็นต์ (%)',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Radio(
                      fillColor: MaterialStateProperty.all(Colors.blue),
                      value: 0,
                      groupValue: _selectedPercent,
                      onChanged: (value) {
                        setState(() {
                          _selectedPercent = value!;
                        });
                      },
                    ),
                    Text('\t0', style: TextStyle(fontSize: 18)),
                    SizedBox(width: 15),
                    Radio(
                      fillColor: MaterialStateProperty.all(Colors.blue),
                      value: 10,
                      groupValue: _selectedPercent,
                      onChanged: (value) {
                        setState(() {
                          _selectedPercent = value!;
                        });
                      },
                    ),
                    Text('\t10', style: TextStyle(fontSize: 18)),
                    SizedBox(width: 15),
                    Radio(
                      fillColor: MaterialStateProperty.all(Colors.blue),
                      value: 15,
                      groupValue: _selectedPercent,
                      onChanged: (value) {
                        setState(() {
                          _selectedPercent = value!;
                        });
                      },
                    ),
                    Text('\t15', style: TextStyle(fontSize: 18)),
                    SizedBox(width: 15),
                    Radio(
                      fillColor: MaterialStateProperty.all(Colors.blue),
                      value: 20,
                      groupValue: _selectedPercent,
                      onChanged: (value) {
                        setState(() {
                          _selectedPercent = value!;
                        });
                      },
                    ),
                    Text('\t20', style: TextStyle(fontSize: 18)),
                    SizedBox(width: 15),
                    Radio(
                      fillColor: MaterialStateProperty.all(Colors.blue),
                      value: 25,
                      groupValue: _selectedPercent,
                      onChanged: (value) {
                        setState(() {
                          _selectedPercent = value!;
                        });
                      },
                    ),
                    Text('\t25', style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนงวด',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: DropdownButton(
                    value: _selectedValue,
                    hint: Text(
                      'เลือกจำนวนงวด',
                      style: TextStyle(color: Colors.blue),
                    ),
                    items: [
                      DropdownMenuItem(
                        child: Text('12 งวด (1 ปี)',
                            style: TextStyle(color: Colors.blue)),
                        value: 12,
                      ),
                      DropdownMenuItem(
                        child: Text('24 งวด (2 ปี)',
                            style: TextStyle(color: Colors.blue)),
                        value: 24,
                      ),
                      DropdownMenuItem(
                        child: Text('36 งวด (3 ปี)',
                            style: TextStyle(color: Colors.blue)),
                        value: 36,
                      ),
                      DropdownMenuItem(
                        child: Text('48 งวด (4 ปี)',
                            style: TextStyle(color: Colors.blue)),
                        value: 48,
                      ),
                      DropdownMenuItem(
                        child: Text('60 งวด (5 ปี)',
                            style: TextStyle(color: Colors.blue)),
                        value: 60,
                      ),
                      DropdownMenuItem(
                        child: Text('72 งวด (6 ปี)',
                            style: TextStyle(color: Colors.blue)),
                        value: 72,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ดอกเบี้ย/ % ต่อปี',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: interestCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        calculateFinance();
                      },
                      child: Text(
                        'คำนวณ',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.4, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _selectedPercent = 0;
                          priceCtrl.clear();
                          interestCtrl.clear();
                          _selectedValue = null;
                        });
                      },
                      child: Text(
                        'ยกเลิก',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.4, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
