class ContactModel{

  final String id;
  final String name;
  final String? email;
  final String phoneNo;
  final String? imagePath;

  ContactModel({required this.id,required this.name,this.email,required this.phoneNo,this.imagePath});
}