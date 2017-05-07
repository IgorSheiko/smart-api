class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :authentication_token, :roles

  has_one :profile, serializer: ProfileSerializer

  def roles
    object.roles.pluck(:name)
  end
end
