class Book < ApplicationRecord
    enum status: [:'en estante', :prestado]
    validates :title, presence: { message: "No te olvides de poner el título del libro" }
end
