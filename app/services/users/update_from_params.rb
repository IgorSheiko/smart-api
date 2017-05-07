module Users
  class UpdateFromParams
    attr_reader :sent_params, :user

    def self.call(user, sent_params)
      new(user, sent_params).call
    end

    def initialize(user, sent_params)
      @sent_params = sent_params
      @user = user
    end

    def call
      user.update(user_params) if user_params.present?
      user.profile.update(profile_params) if sent_params[:profile].present?

      user
    end

    private

    def user_params
      sent_params.permit(:email, :password)
    end

    def profile_params
      sent_params.require(:profile).permit(:first_name, :last_name,
                                           :birth_date,
                                           :sex, :phone_number)
    end
  end
end
