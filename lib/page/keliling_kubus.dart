import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perhitungan_kubus/theme.dart';

class KelilingKubus extends StatefulWidget {

  @override
  _KelilingKubusState createState() => _KelilingKubusState();
}

class _KelilingKubusState extends State<KelilingKubus> {

  double result;
  double formula;
  TextEditingController sisiController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {

    handleResult(){
      if(sisiController.text.toString().isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.redAccent,
              content: Text(
                  'Form sisi belum terisi'
              ),
            )
        );
      }else{
        setState(() {
          double getNumber = double.parse(sisiController.text);
          result = 12 * getNumber;
        });
      }
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      'assets/gambar_kubus.png'
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rumus Keliling Kubus',
                    style: titleTextStyle.copyWith(
                        fontSize: 25
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black12
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20
                    ),
                    child:Text(
                      'K = 12 x S',
                      style: subtitleTextStyle.copyWith(
                          fontSize: 20
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Masukkan Sisi',
                style: titleTextStyle.copyWith(
                    fontSize: 25
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black12,
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20
                ),
                child: Expanded(
                  child: TextFormField(
                    style: titleTextStyle,
                    controller: sisiController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Masukkan Panjang Sisi',
                      hintStyle: subtitleTextStyle
                    ),
                  ),
                ),
              ),
              Text(
                'Hasil',
                style: titleTextStyle.copyWith(
                    fontSize: 25
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black12,
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20
                ),
                child: Text(
                  result == null ? '0' : result.toStringAsFixed(2),
                  style: titleTextStyle.copyWith(
                    fontSize: 20
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: TextButton(
                  onPressed:  handleResult,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                    )
                  ),
                  child: Text(
                    'Hasil',
                    style: titleTextStyle.copyWith(
                      fontSize: 20,
                      color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
