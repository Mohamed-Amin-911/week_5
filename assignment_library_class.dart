class Library {
  String name;
  List<Book> books;
  Library({required this.name}) : books = [];
  void addBook(Book book) {
    books.add(book);
    print('${book.title} added to the library');
  }

  void removeBook(Book book) {
    if (books.contains(book)) {
      books.remove(book);
      print('${book.title} removed from the library');
    } else {
      print('${book.title} is not found in the library');
    }
  }

  List<Book> findBooksByAuthor(String author) {
    return books.where((book) => book.author == author).toList();
  }

  List<Book> findAvailableBooks() {
    return books.where((book) => !book.checkedOut).toList();
  }
}

class Book {
  String author;
  String title;
  String ISBN;
  bool checkedOut;
  Book({required this.title, required this.author, required this.ISBN})
      : checkedOut = false;

  checkOut() {
    if (!checkedOut) {
      checkedOut = true;
    } else {
      print('Sorry, $title is already checked out');
    }
  }

  checkIn() {
    if (checkedOut) {
      checkedOut = false;
    } else {
      print('$title is not currently checked out');
    }
  }
}

class Member {
  String name;
  List<Book> booksCheckedOut;
  Member({required this.name}) : booksCheckedOut = [];

  void checkOutBook(Book book) {
    if (!book.checkedOut) {
      booksCheckedOut.add(book);
      book.checkOut();
      print('${book.title} is checked out by $name');
    } else {
      print('Sorry, ${book.title} is already checked out');
    }
  }

  void returnBook(Book book) {
    if (booksCheckedOut.contains(book)) {
      booksCheckedOut.remove(book);
      book.checkIn();
      print('${book.title} is checked in by $name');
    } else {
      print('${book.title} is not checked out by $name');
    }
  }
}

void main() {
  Book book1 = Book(title: "title 1", author: "author 1", ISBN: "ISBN 1");
  Book book2 = Book(title: "title 2", author: "author 2", ISBN: "ISBN 2");
  Book book3 = Book(title: "title 3", author: "author 3", ISBN: "ISBN 3");
  Library library = Library(name: "Library 1");
  library.addBook(book1);
  library.addBook(book2);
  library.addBook(book3);
  print('\n');
  Member member = Member(name: "Member 1");
  member.checkOutBook(book1);
  member.checkOutBook(book2);
  member.returnBook(book2);
  print('\n');
  library
      .findAvailableBooks()
      .forEach((book) => print('${book.title} is available.'));
}
