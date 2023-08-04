import 'package:flutter/material.dart';
import 'package:lib/src/constants/constants.dart';
import 'package:lib/src/features/home/account/account_storage.dart';
import 'package:lib/src/features/home/homescreen/home.dart';

class createAccount extends StatefulWidget {
  const createAccount({Key? key}) : super(key: key);

  @override
  State<createAccount> createState() => _createAccountState();
}

class _createAccountState extends State<createAccount> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _MailController = TextEditingController();
  final TextEditingController _PassController = TextEditingController();
  final TextEditingController _CheckController = TextEditingController();
  final SecureStorage _secureStorage = SecureStorage();

  @override
  void initState() {
    super.initState();
    fetchSecureStorageData();
  }

  Future<void> fetchSecureStorageData() async {
    _NameController.text = await _secureStorage.getName() ?? '';
    _MailController.text = await _secureStorage.getMail() ?? '';
    _PassController.text = await _secureStorage.getPass() ?? '';
    _CheckController.text = await _secureStorage.getCheck() ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(v['Ca'].toString()),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _NameController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: v['An'],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _MailController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: v['Ma'],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _PassController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: v['Pa'],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _CheckController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: v['Pc'],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      onPressed: () async {
                        await _secureStorage.setName(_NameController.text);
                        await _secureStorage.setMail(_MailController.text);
                        await _secureStorage.setPass(_PassController.text);
                        await _secureStorage.setCheck(_CheckController.text);
                        v['Name'] = _NameController.text;
                        v['Mail'] = _MailController.text;
                        v['Pass'] = _PassController.text;
                        v['Check'] = _CheckController.text;

                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => HomeScreen()),);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(v['Cm'].toString(),
                                  textAlign: TextAlign.center),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(v['Fi'].toString()),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
