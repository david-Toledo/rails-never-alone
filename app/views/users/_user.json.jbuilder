json.extract! user, :id, :name, :last_name, :email, :password, :image, :about, :address, :longitude, :latitude, :admin, :user_active, :user_type, :police_check, :national_id, :covid_safe_certifcate, :created_at, :updated_at
json.url user_url(user, format: :json)
