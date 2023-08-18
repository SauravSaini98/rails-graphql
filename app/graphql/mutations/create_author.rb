module Mutations
  class CreateAuthor < BaseMutation
    argument :name, String, required: true

    type Types::AuthorType

    def resolve(name:)
      Author.create!(name: name)
    end
  end
end