# app/lib/message.rb
class Message
  def self.not_found(record = 'record')
    "Lo siento, #{record} no ha sido encontrado."
  end

  def self.invalid_credentials
    'El email o la contraseña son invalidos'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Falta el token en el request'
  end

  def self.unauthorized
    'NUnauthorized request'
  end

  def self.account_created
    'Cuenta creada correctamente'
  end

  def self.login
    'Ha iniciado sesion'
  end

  def self.account_not_created
    'La cuenta no pudo ser creada'
  end

  def self.expired_token
    'Lo sentimos, la session ha expirado. Inicie session para continuar.'
  end
end
