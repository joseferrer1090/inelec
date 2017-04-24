class AuthenticateUser
  def initialize(email, password)
    @email = email
    @password = password
  end

  # Service entry point
  def call
    data
  end

  private

  attr_reader :email, :password

  # verify user credentials
  def user
    user = User.find_by(email: email)
    return user if user && user.authenticate(password)
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::InvalidToken, Message.invalid_credentials)
  end

  def data
    token = JsonWebToken.encode(user_id: user.id) if user
    exp = JsonWebToken.decode(token)[:exp]
    avatar = $base_url + user.avatar.url
    @user = user.as_json(:include => { :roles => { :include => :permissions } }).merge("avatar" => avatar ).as_json
    return {token: token,exp: (Time.at(exp)-Time.now).to_i, user: @user, type: 'Bearer'}
  end
end
