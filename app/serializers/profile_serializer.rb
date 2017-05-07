class ProfileSerializer < ActiveModel::Serializer
  attributes :id,
             :first_name,
             :last_name,
             :sex,
             :birth_date,
             :phone_number,
             :user_id,

  def birth_date
    object.birth_date.strftime('%d.%m.%Y')
  end
end
