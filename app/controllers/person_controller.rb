class PersonController < ApplicationController
  def index
    @persons = Person.order("updated_at DESC").all
  end

  def search
    @search = PersonInfo.new.call(person_params)

    respond_to do |format|
      format.js
    end
  end

  private

  def person_params
    params.permit(:version,
                  :number,
                  :enumeration_type,
                  :taxonomy_description,
                  :first_name,
                  :use_first_name_alias,
                  :last_name,
                  :organization_name,
                  :address_purpose,
                  :city,
                  :state,
                  :postal_code,
                  :country_code,
                  :limit,
                  :skip)
  end
end
