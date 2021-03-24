final RegExp mailRegEx = RegExp(r'\b[\w\d\W\D]+(?:@(?:[\w\d\W\D]+(?:\.(?:[\w\d\W\D]+))))\b');
final RegExp passwordRegEx = RegExp(r'[A-Z]+');
final RegExp phoneRegex = RegExp(r"^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$");
final RegExp bvnRegex = RegExp(r"\d{11}");
final RegExp xmlRegex = RegExp(r"<.+?>");