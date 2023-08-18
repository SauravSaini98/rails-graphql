module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :authors, [AuthorType], null: false
    field :books, [BookType], null: false
    field :author, AuthorType, null: false do
      argument :id, ID, required: true
    end
    field :book, BookType, null: false do
      argument :id, ID, required: true
    end

    def authors
      Author.all
    end

    def books
      Book.all
    end

    def author(id:)
      Author.find(id)
    end

    def book(id:)
      Book.find(id)
    end

  end
end
