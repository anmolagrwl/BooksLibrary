class Book < ActiveRecord::Base
  attr_accessible :id, :name, :volume, :year, :comment, :place_id, :user_id, :authors_attributes,
                  :on_sale, :sold, :price, :sold_date

  belongs_to :place
  belongs_to :user
  has_many :authors, dependent: :destroy

  accepts_nested_attributes_for :authors, allow_destroy: true, reject_if: lambda { |a| a[:name].blank? }

  validates :name,  presence: true, length: { maximum: 80 }
  validates :volume,  length: { maximum: 20 }
  validates_numericality_of :year, allow_nil: true, greater_than: 1900, less_than_or_equal_to: Time.now.year
  validates :comment,  length: { maximum: 350 }
  validates_numericality_of :price, allow_nil: true
  validates :user_id,  presence: true

  def self.import(file, user)
    spreadsheet = open_spreadsheet(file)

    # Destroying old information
    Place.destroy_all(user_id: user.id)
    Book.destroy_all(user_id: user.id)

    # Creating new information
    spreadsheet.sheets.each do |sheet|
      place = Place.new(user_id: user.id, name: sheet)
      place.save
      spreadsheet.default_sheet = sheet
      (2..spreadsheet.last_row).each do |line|
        book = Book.new(user_id: user.id)
        author_names = spreadsheet.cell(line, 'A')
        unless author_names.blank?
          author_names.to_s.split(',').each do |name|
            book.authors << Author.create(name: name.strip)
          end
        end
        book.name = spreadsheet.cell(line, 'B')
        book.volume = spreadsheet.cell(line, 'C').to_s.gsub(/\.0/, '')
        book.year = spreadsheet.cell(line, 'D')
        book.comment = spreadsheet.cell(line, 'E')
        book.place_id = place.id
        book.save
      end
    end
  rescue
    return {key: :error, value: "Some error happened. Books weren't imported. We are sorry."}
  else 
    return {key: :notice, value: 'Books successfully imported'}
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".xls" then Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Excelx.new(file.path, nil, :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
