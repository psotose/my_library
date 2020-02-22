class Book < ApplicationRecord
    max_paginates_per 100
    enum status: [:'en estante', :prestado]
    validates :title, presence: { message: "No te olvides de poner el título del libro" }
    before_validation { |book| book.title.upcase! }
    
    validate :returned_after_borrow
    validates :borrow_date, :returned_date, :presence => true

    private
    
    def returned_after_borrow
        return if returned_date.blank? || borrow_date.blank?
            if returned_date < borrow_date
                errors.add(:returned_date, "La fecha de devolución debe ser posterior a la del préstamo") 
            end 
        end
    end
    

