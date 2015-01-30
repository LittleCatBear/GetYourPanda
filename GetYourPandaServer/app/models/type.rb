class Type < ActiveRecord::Base
	has_many :images, dependent: :destroy
	validates :name, presence: true,
                    length: { minimum: 3 }
end
