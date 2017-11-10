class Breadcrumb < ApplicationRecord

	# ENUM
	enum status: 
  {
    'Selecione...':        			0,
    'Funcionando':        			1,
    'Apresenta problema':       2
  }

	# MAP
	belongs_to :user_tested, foreign_key: 'user_tested_id', class_name: 'User'
	belongs_to :user_created, foreign_key: 'user_created_id', class_name: 'User'

  has_many :paths, inverse_of: :breadcrumb
  accepts_nested_attributes_for :paths, reject_if: :all_blank, allow_destroy: true

	# VALIDATIONS
	validates_presence_of :name, length: { maximum: 255 }
	validates :code, uniqueness: true, length: { maximum: 6 }

end
