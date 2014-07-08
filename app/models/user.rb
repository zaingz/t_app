class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :cnic

  geocoded_by :address, :latitude => :add_latitude , :longitude => :add_longitude do |obj, result|
    if geo = result.first and obj.address_changed?
      obj.add_latitude = geo.latitude
      obj.add_longitude = geo.longitude
    end
  end

  reverse_geocoded_by :add_latitude, :add_longitude, :address => :address   do |obj, result|
    if geo = result.first
      if obj.add_latitude_changed? or obj.add_longitude_changed?
        obj.address = geo.address
      end
    end
  end

  after_validation :geocode, :reverse_geocode

end
