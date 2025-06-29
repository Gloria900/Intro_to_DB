-- Create the Authors table
CREATE TABLE IF NOT EXISTS Authors(
  author_id INT PRIMARY KEY AUTO_INCREMENT,
  author_name VARCHAR(215) NOT NULL
);

-- Create the Books table
CREATE TABLE IF NOT EXISTS Books(
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(130) NOT NULL,
  author_id INT NOT NULL,
  price DOUBLE NOT NULL,
  publication_date DATE,

  CONSTRAINT FK_AuthorID FOREIGN KEY (author_id)
  REFERENCES Authors(author_id)
);

-- Create the Customers table
CREATE TABLE IF NOT EXISTS Customers(
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_name VARCHAR(215) NOT NULL,
  email VARCHAR(215) NOT NULL UNIQUE,
  address TEXT
);

-- Create the Orders table
CREATE TABLE IF NOT EXISTS Orders(
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT NOT NULL,
  order_date DATE,
  CONSTRAINT FK_CustomerId FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create the Order_Details table
CREATE TABLE IF NOT EXISTS Order_Details(
  orderdetailid INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT NOT NULL,
  book_id INT NOT NULL,
  quantity DOUBLE NOT NULL,
  CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  CONSTRAINT FK_OrderDetails_Books FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- SHOW TABLES;
-- SELECT * FROM Authors;
-- SELECT * FROM Books;
-- SELECT * FROM Customers;
-- SELECT * FROM Orders;
-- SELECT * FROM Order_Details;