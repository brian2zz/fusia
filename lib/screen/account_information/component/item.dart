import 'package:flutter/material.dart';
import 'package:fusia/screen/change_password/change_password_screen.dart';

class ButtonSave extends StatelessWidget {
  const ButtonSave({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        color: Color.fromARGB(255, 80, 36, 35),
        onPressed: () {},
        child: Text(
          'Save',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class ChangePassword extends StatelessWidget {
  const ChangePassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return changePassword();
          }),
        );
      },
      leading: Icon(Icons.lock_outline,
          color: Color.fromARGB(255, 34, 50, 99)),
      title: Text(
        'Change Password        *****************',
        style: TextStyle(
          color: Color.fromARGB(255, 34, 50, 99),
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins',
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}

class textField extends StatelessWidget {
  final String textController;
  const textField({
    Key? key,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color.fromARGB(255, 34, 50, 99)),
        ),
        border: new OutlineInputBorder(
            borderSide: new BorderSide(
          color: Color.fromARGB(255, 235, 240, 255),
        )),
      ),
      controller: TextEditingController(text: textController),
      style: TextStyle(
        color: Color.fromARGB(255, 144, 152, 177),
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }
}

class Label extends StatelessWidget {
  final String label;
  const Label({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        color: Color.fromARGB(255, 34, 50, 99),
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    );
  }
}

class AvatarProfile extends StatelessWidget {
  final String PhotoProfile;
  const AvatarProfile({
    required this.PhotoProfile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 60),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(PhotoProfile),
          ),
          SizedBox(height: 25),
          InkWell(
            onTap: () {},
            child: Text(
              'Ubah Photo Profile',
              style: TextStyle(
                color: Color.fromARGB(255, 34, 50, 99),
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
