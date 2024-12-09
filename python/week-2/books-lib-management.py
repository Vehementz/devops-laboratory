# Créez un système de gestion de bibliothèque en utilisant la POO. Le système doit comprendre les classes suivantes :

# Livre : Représente un livre avec des attributs tels que titre,
#  - auteur, 
#  - ISBN,
#  - et statut (emprunté ou disponible).
# Membre : Représente un membre de la bibliothèque avec des attributs comme 
# - nom, 
# - ID de membre, 
# - et liste des livres empruntés.

# Bibliotheque : Gère la collection de livres et les membres.

# Implémentez les fonctionnalités suivantes :
#     Ajouter et supprimer des livres de la bibliothèque
#     Enregistrer de nouveaux membres
#     Permettre aux membres d'emprunter et de retourner des livres
#     Afficher la liste des livres disponibles
#     Afficher la liste des livres empruntés par un membre
#     Rechercher un livre par titre ou auteur


class Book:
    """
    A class representing a book with attributes:
    - title
    - author
    - ISBN
    - status (borrowed or available)
    """
    def __init__(self, title, author, ISBN, status="Available"):
        self.title = title
        self.author = author
        self.ISBN = ISBN
        self.status = status

    def __str__(self):
        return f"{self.title} by {self.author} (ISBN: {self.ISBN}) - Status: {self.status}"


class Member:
    """
    A class representing a library member:
    - name
    - member ID
    - list of borrowed books
    """
    def __init__(self, name, ID):
        self.name = name
        self.ID = ID
        self.borrowed_books = []

    def __str__(self):
        return f"Member: {self.name}, ID: {self.ID}"


class Library:
    """
    A class representing the library. It manages:
    - The book collection
    - The members

    Functionalities:
    - Add and remove books
    - Register new members
    - Borrow and return books
    - Display the list of available books
    - Display the list of books borrowed by a member
    - Search for a book by title or author
    """
    def __init__(self, books=None):
        if books is None:
            self.books = []
        else:
            self.books = books
        self.members = {}  # Key: member ID, Value: Member instance

    def add_book(self, book):
        """
        Adds a book to the collection.
        """
        self.books.append(book)
        print(f"The book '{book.title}' has been added to the library.")

    def remove_book(self, ISBN):
        """
        Removes a book from the collection by its ISBN.
        """
        for book in self.books:
            if book.ISBN == ISBN:
                self.books.remove(book)
                print(f"The book '{book.title}' (ISBN: {ISBN}) has been removed from the library.")
                return
        print(f"No book with ISBN {ISBN} found in the library.")

    def register_member(self, member):
        """
        Registers a new member in the library.
        """
        if member.ID in self.members:
            print(f"A member with ID {member.ID} already exists.")
        else:
            self.members[member.ID] = member
            print(f"The member '{member.name}' has been registered with ID {member.ID}.")

    def borrow_book(self, member_ID, ISBN):
        """
        Allows a member to borrow a book if it is available.
        """
        if member_ID not in self.members:
            print(f"No member with ID {member_ID}.")
            return

        for book in self.books:
            if book.ISBN == ISBN:
                if book.status == "Available":
                    book.status = "Borrowed"
                    self.members[member_ID].borrowed_books.append(book)
                    print(f"The member '{self.members[member_ID].name}' has borrowed '{book.title}'.")
                else:
                    print(f"The book '{book.title}' is already borrowed.")
                return

        print(f"No book with ISBN {ISBN} found in the library.")

    def return_book(self, member_ID, ISBN):
        """
        Allows a member to return a book.
        """
        if member_ID not in self.members:
            print(f"No member with ID {member_ID}.")
            return

        member = self.members[member_ID]
        for book in member.borrowed_books:
            if book.ISBN == ISBN:
                book.status = "Available"
                member.borrowed_books.remove(book)
                print(f"The member '{member.name}' has returned the book '{book.title}'.")
                return

        print(f"The member '{member.name}' does not have this book borrowed.")

    def display_available_books(self):
        """
        Displays the list of available books.
        """
        available_books = [book for book in self.books if book.status == "Available"]
        if available_books:
            print("Available books:")
            for book in available_books:
                print(f"- {book}")
        else:
            print("No books are available.")

    def display_borrowed_books_by_member(self, member_ID):
        """
        Displays the list of books borrowed by a specific member.
        """
        if member_ID not in self.members:
            print(f"No member with ID {member_ID}.")
            return

        member = self.members[member_ID]
        if member.borrowed_books:
            print(f"Books borrowed by {member.name}:")
            for book in member.borrowed_books:
                print(f"- {book}")
        else:
            print(f"No books are currently borrowed by {member.name}.")

    def search_book(self, term):
        """
        Searches for a book by title or author. Displays all matching books.
        """
        results = [book for book in self.books if term.lower() in book.title.lower() or term.lower() in book.author.lower()]
        if results:
            print(f"Search results for '{term}':")
            for book in results:
                print(f"- {book}")
        else:
            print(f"No books found for the term '{term}'.")


# Example usage
if __name__ == "__main__":
    # Create the library with the list of books already provided in the constructor above
    lib = Library([
        Book(title="1984", author="George Orwell", ISBN="9780451524935", status="Available"),
        Book(title="To Kill a Mockingbird", author="Harper Lee", ISBN="9780060935467", status="Borrowed"),
        Book(title="Pride and Prejudice", author="Jane Austen", ISBN="9780679783268", status="Available"),
        Book(title="The Catcher in the Rye", author="J.D. Salinger", ISBN="9780316769488", status="Borrowed"),
        Book(title="The Hobbit", author="J.R.R. Tolkien", ISBN="9780345339683", status="Available"),
        Book(title="Fahrenheit 451", author="Ray Bradbury", ISBN="9781451673319", status="Available"),
        Book(title="Brave New World", author="Aldous Huxley", ISBN="9780060850524", status="Borrowed"),
        Book(title="Moby Dick", author="Herman Melville", ISBN="9781503280786", status="Available"),
        Book(title="War and Peace", author="Leo Tolstoy", ISBN="9780307387844", status="Borrowed"),
        Book(title="The Lord of the Rings", author="J.R.R. Tolkien", ISBN="9780395489338", status="Available"),
        Book(title="A Tale of Two Cities", author="Charles Dickens", ISBN="9781853262647", status="Available"),
        Book(title="Crime and Punishment", author="Fyodor Dostoevsky", ISBN="9780486415871", status="Borrowed")
    ])

    # Registering members
    member1 = Member("Marco", 1)
    member2 = Member("Clara", 2)
    member3 = Member("Justine", 8)
    lib.register_member(member1)
    lib.register_member(member2)

    # Borrow a book
    lib.borrow_book(1, "9780679783268")

    # Display available books
    lib.display_available_books()

    # Display borrowed books by a member
    lib.display_borrowed_books_by_member(1)

    # Search for a book
    lib.search_book("Orwell")
    new_book = Book(title="Little Women", author="Louisa May Alcott", ISBN="9780147514011", status="Available")
    lib.add_book(new_book)

    new_books_data = [
    {"title": "Little Women", "author": "Louisa May Alcott", "ISBN": "9780147514011", "status": "Available"},
    {"title": "The Picture of Dorian Gray", "author": "Oscar Wilde", "ISBN": "9780141439570", "status": "Available"},
    {"title": "Les Misérables", "author": "Victor Hugo", "ISBN": "9781846140495", "status": "Borrowed"},
    {"title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "ISBN": "9780743273565", "status": "Available"}
    ]

    for book_info in new_books_data:
        book = Book(title=book_info["title"], author=book_info["author"], ISBN=book_info["ISBN"], status=book_info["status"])
        lib.add_book(book)


    # Return a book
    lib.return_book(1, "9780679783268")

    # Display available books after return
    lib.display_available_books()

    lib.search_book("Victor Hugo")
    lib.search_book("Gatsby")
