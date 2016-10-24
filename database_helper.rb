require 'database'

# Sequel cheat sheet:
# http://sequel.jeremyevans.net/rdoc/files/doc/cheat_sheet_rdoc.html
module DatabaseHelper
  class << self
    def all_pages
      DB[:Pages].all
    end

    def get(id)
      # TODO
      # to implement getting from db
      # DB[:Pages].filter(:id => id)
      # DB[:Pages].filter(:id => id).select(:page)

      DB[:Pages][id: id][:page]
    end

    def create(page)
      DB[:Pages].insert(page: page)
    end

    def delete(id)
      # TODO
      # to implement deleting
      DB[:Pages].where(:id => id).delete
    end
  end
end
