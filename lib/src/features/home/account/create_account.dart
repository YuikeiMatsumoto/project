import 'package:flutter/material.dart';
import 'package:lib/src/constants/constants.dart';
import 'package:lib/src/features/home/account/account_storage.dart';
import 'package:lib/src/features/move_app/app_tab.dart';

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
        title: const Text(createAccountText),
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
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: inputAccountNameForm,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _MailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: inputMailAddressForm,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _PassController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: inputPasswordForm,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _CheckController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: inputPasswordForConfirmForm,
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
                        accountNameText = _NameController.text;
                        mailAddressText = _MailController.text;
                        passwordText = _PassController.text;
                        passwordForConfirmText = _CheckController.text;

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(createdAccountNotice,
                                textAlign: TextAlign.center),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        Future.delayed(Duration(seconds: 3), () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => MyApp()),);
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(finishedButton),
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