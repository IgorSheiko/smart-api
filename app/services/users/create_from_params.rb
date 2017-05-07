module Users
  class CreateFromParams
    attr_reader :params

    def self.call(params)
      new(params).call
    end

    def initialize(params)
      @params = params
    end

    def call
      User.create(params_for_create)
    end

    private

    def profile_params
      params.require(:auth).require(:profile).permit(:first_name, :last_name, :sex, :birth_date, :phone_number)
    end

    def user_params
      params.require(:auth).permit(:email, :password, :public_offer_accepted)
    end

    def params_for_create
      user_params.merge(profile_attributes: profile_params)
    end
  end
end
