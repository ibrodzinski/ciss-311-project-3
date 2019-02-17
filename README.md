# ciss-311-project-3
Agile Software Development with C# Book II - Project 3

Just a school project for C#!


Project Three 
The Problem: 

The Tiny college has a Tiny Library that needs a desktop application to keep track (fits books. For simplicity, the college has print books only. The following paragraphs are purposefully unorganized by database tables and their attributes. They focus on the requirements from the user's point of view. 

When a new book arrives, a librarian can enter the following data into the system: book title, author(s), copyright year (4 digit year), ISBN (assuming 13 digits only), location (e.g. shelf number), and number of copies (the Tiny Library may buy multiple copies of the same book). 

An author has first name, last name, and about_the_author. Two authors may have the same names with different about_the_author. The librarian makes the decision if two authors are the same or not. 

A librarian can add new borrowers. There are two types of borrowers in Tiny college: students and faculty. The students can check out 2 books at any (a small number for your testing convenience) and a faculty can check out 3 books at any time. In other words, at any Time, a student cannot hold more than 2 books and a faculty cannot hold more than 3 books. A borrower has an ID, a firstname, and a lastname. 

When a book is checked out, the administrator wants to know who borrows it by entering a book's ISBN. The application should list all borrowers who have checked out that book. (Remember, a book has multiple copies) 

Each book can be checked out for exactly one month (some months will have more days than other months and that's ok). A book checked out on Feb 1 2017 will be due on March 1, 2017. 

When a borrower checks out or returns a book, the status for both the book and the borrower should be updated. E.g. how many more books the borrower can borrow and the book's availability are updated. 

The library lets a user search for a book, by its title, author(s), or ISBN. It will display how many copies are available and the location of the book in addition to the books' information. 

The administrator wants to list all borrowers who have books overdue as of today. The administrator wants to know who borrows a certain book and when each copy should be returned. 

If a borrower has overdue items, he or she won't be able to check out any additional books. If a borrower has reached his or her borrowing capacity, he or she won't be able to check out any additional books. 
