module Types
  class MutationType < Types::BaseObject
    field :create_author, mutation: Mutations::CreateAuthor
    field :create_book, mutation: Mutations::CreateBook
  end
end
