# a program for simulating a library
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


mutable struct Library
    name::String
    books::Dict{String, Book} # Book objs are indexed by their id Strings
    members::Dict{String, User} # User " ... "

    function Library(newName::String)
        newBooks = Dict{String, Book}()
        newMembers = Dict{String, User}()
        new(newName, newBooks, newMembers)
    end
end

"Adds a generated user to the library."
function addNewUser!(library::Library)
    newUser = User()
    println("prior", library.members)
    merge!(library.members, Dict(newUser.id => newUser))
    println("post", library.members)
end



# DEBUGGING
# randomUser = User()
# println("typeof randomUser: ", typeof(randomUser))
# println("randomUser's id: ", randomUser.id, ", name: ", randomUser.name)

SCPL = Library("Santa Cruz Public Library")
println("typeof SCPL: ", typeof(SCPL))
println("SCPL's name: ", SCPL.name, " books: ", SCPL.books, " members: ", SCPL.members)
addNewUser!(SCPL)