enum TypeErrorException { INFORMATIVE, ERROR, SUCCESS, WARNING }

class ExceptionCode {
  final String message;
  final TypeErrorException errorType;
  ExceptionCode({required this.message, required this.errorType});
}

class Exceptions {
  static const String userNotActive = 'Usuario no activo';
}

ExceptionCode applyExceptionCode(String exceptionCode) {
  switch (exceptionCode) {
     case 'user_not_disabled':
      return ExceptionCode(
        message:
            'Usuario desactivado \n Este usuario ha sido desactivado, por favor contacta al soporte para recuperar tu cuenta.',
        errorType: TypeErrorException.ERROR,
      );
    case 'user_not_active':
      return ExceptionCode(
        message:
            'Usuario en espera \n Estamos revisando tu cuenta, por favor espera que los administradores activen tu cuenta.\n Si no recibes una respuesta en 24 horas, por favor contacta a soporte.',
        errorType: TypeErrorException.INFORMATIVE,
      );
    case 'user_deleted':
      return ExceptionCode(
        message:
            'Usuario eliminado \n Este usuario ha sido eliminado, por favor contacta al soporte para recuperar tu cuenta.',
        errorType: TypeErrorException.ERROR,
      );
    case 'email_not_confirmed':
      return ExceptionCode(
        message:
            'Email no confirmado \n Por favor, ingresa a tu email y confirma tu cuenta.',
        errorType: TypeErrorException.INFORMATIVE,
      );
    case 'email_already_in_use':
      return ExceptionCode(
        message: 'Email ya en uso \n Por favor, ingresa un email diferente.',
        errorType: TypeErrorException.INFORMATIVE,
      );
    case 'invalid_credentials':
      return ExceptionCode(
        message:
            'Credenciales inválidas \n Por favor, ingresa un email y contraseña válidos.',
        errorType: TypeErrorException.ERROR,
      );
    case 'invalid_password':
      return ExceptionCode(
        message:
            'Contraseña inválida \n Por favor, ingresa una contraseña válida.',
        errorType: TypeErrorException.ERROR,
      );
    case 'invalid_email':
      return ExceptionCode(
        message: 'Email inválido \n Por favor, ingresa un email válido.',
        errorType: TypeErrorException.INFORMATIVE,
      );
    case 'invalid_otp':
      return ExceptionCode(
        message: 'OTP inválido \n Por favor, ingresa un OTP válido.',
        errorType: TypeErrorException.INFORMATIVE,
      );
    case 'invalid_token':
      return ExceptionCode(
        message: 'Token inválido \n Por favor, ingresa un token válido.',
        errorType: TypeErrorException.INFORMATIVE,
      );
    case 'invalid_user':
      return ExceptionCode(
        message: 'Usuario inválido \n Por favor, ingresa un usuario válido.',
        errorType: TypeErrorException.INFORMATIVE,
      );
    case 'invalid_company':
      return ExceptionCode(
        message: 'Empresa inválida \n Por favor, ingresa una empresa válida.',
        errorType: TypeErrorException.INFORMATIVE,
      );
    case 'invalid_user_company':
      return ExceptionCode(
        message:
            'Usuario empresa inválida \n Por favor, ingresa un usuario empresa válido.',
        errorType: TypeErrorException.INFORMATIVE,
      );
    case 'invalid_user_company_company':
      return ExceptionCode(
        message:
            'Usuario empresa empresa inválida \n Por favor, ingresa un usuario empresa empresa válido.',
        errorType: TypeErrorException.INFORMATIVE,
      );
    case 'invalid_user_company_user':
      return ExceptionCode(
        message:
            'Usuario empresa usuario inválido \n Por favor, ingresa un usuario empresa usuario válido.',
        errorType: TypeErrorException.INFORMATIVE,
      );
    default:
      return ExceptionCode(
        message: exceptionCode,
        errorType: TypeErrorException.ERROR,
      );
  }
}
