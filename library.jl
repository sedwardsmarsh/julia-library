# a program for simulating a library
using Random

"Generates a first and last name."
function generateName()
    firstNames::Array{String} = Array(["Anya", "Billy", "Collin", "Declan", "Ella"])
    lastNames::Array{String} = Array(["Albright", "Banks", "Coldwater", "Doves", "English"])
    newName::String = rand(firstNames) * " " * rand(lastNames)
    return newName
end


struct User
    id::String
    name::String

    function User()
        newId::String = randstring(8)
        newName::String = generateName()
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
        titlePrefixes::Array{String} = Array(["The", "Crazy Amounts of", "Blank", "Silly"])
        titleSuffixes::Array{String} = Array(["Birds", "Danger", "Girl"])
        newTitle::String = rand(titlePrefixes) * " " * rand(titleSuffixes)
        newAuthor::String = generateName()
        newText::String = "blah " ^ round(Int8, rand() * 20)
        new(newId, newTitle, newAuthor, newText)
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
    merge!(library.members, Dict(newUser.id => newUser))
end

"Adds a generated book to the library."
function addNewBook!(library::Library)
    newBook = Book()
    merge!(library.books, Dict(newBook.id => newBook))
end


# DEBUGGING
println("DEBUGGING OUTPUT:")

SCPL = Library("Santa Cruz Public Library")

# let's add ten books to the library!
for i in 1:10
    addNewBook!(SCPL)
end

# let's add 5 users to the library!
for i in 1:5
    addNewUser!(SCPL)
end

# inspect the library's information
println("Library's name: $(SCPL.name)\n\nThe books are:")
for book in SCPL.books
    println(book.second.title)
end