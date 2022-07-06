// ignore_for_file: constant_identifier_names

class RegexConstants {
  static const EMAIL_REGEX = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const NAME_REGEX = r"^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$";
  static const PASSWORD_REGEX = r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}$';
  static const DATE_REGEX =
      r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$';
  static const OTP_REGEX = r'^\d{6}$';
  static const COURSE_CODE_REGEX = r'^[a-zA-Z0-9]{6,}$';
  static const COURSE_DATE_REGEX =
      r'^([0-2]{1}[0-9]{1}|3[0-1]{1})-(0[1-9]{1}|1[0-2]{1})-[2]{1}0[0-9]{2}$';
  static const COURSE_TIME_REGEX = r'^([01][0-9]|2[0-3]):([0-5][0-9])$';
}
