# a program for checking out books to users in a library
using Random


struct User
    id::String
    name::String

    function User()
        newId::String = randstring(8)
        firstNames::Array{String} = Array(["Anya", "Billy", "Collin", "Declan", "Ella"])
        lastNames::Array{String} = Array(["Albright", "Banks", "Coldwater", "Doves", "English"])
        newName::String = rand(firstNames) * " " * rand(lastNames)
        new(newId, newName)
    end
end


struct Book
    id::String
    title::String
    author::String
    text::String

    function Book()
        newId::String = randstring(8)
        new(newId)
    end
end 


randomUser = User()
println("typeof randomUser: ", typeof(randomUser))
println("randomUser's id: ", randomUser.id, ", name: ", randomUser.name)


# mutable struct Library
#     name::String
#     books::Dict{String, Book} # Book objs are indexed by their id Strings
#     members::Dict{String, User} # User " ... "

#     function Library(;newName::String)
#         newBooks::Dict{String, Book}()
#         newMembers::Dict{String, User}()
#         new(newName, newBooks, newMembers)
#     end

#     # adds a generated user to the library
#     function addNewUser()
        
#     end
# end

# end

# # lets setup a library; the santa cruz public library
# SCPL = Library("Santa Cruz Public Library", )
