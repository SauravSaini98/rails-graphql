module Mutations
  class CreateBook < BaseMutation
    argument :title, String, required: false
    argument :genre, String, required: false
    argument :description, String, required: false
    argument :author_id, ID, required: true

    type Types::BookType

    def resolve(**attributes)
      Book.create!(attributes)
    end
  end
end