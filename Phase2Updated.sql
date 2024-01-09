create table Author
	(Author_ID		varchar(7),
	 Author_Name		char(30),	
	 Author_Email		varchar(30),			
	 primary key (Author_ID)
	 );

create table Librarian 
	(Librarian_ID		varchar(7),
	 First_name		varchar(20) not null,
	 Last_name		varchar(20) not null,
	 Street			varchar(50),
	 City			varchar(20),
	 States			varchar(20),
	 Librarian_phno		numeric(10),
	 Librarian_Email 	varchar(20),
	 primary key (Librarian_ID) 
	);

create table Magazine
	(Issue_ID		varchar(7),
	 Editior		char(20),
	 Contributor		char(20),
	 M_Title		char(30),	
	 M_Genre		char(30),			
	 primary key (Issue_ID)
	 );

create table Publisher 
	(Publisher_ID		varchar(7),
	 Year_of_publication	numeric(4,0),	
	 Publisher_Email	varchar(30),			
	 primary key (Publisher_ID)
	 );



create table Member
	(Librarian_ID		varchar(7),
	 Member_ID		varchar(7),
	 First_name		varchar(20) not null,
	 Last_name		varchar(20) not null,
	 Street			varchar(50),
	 City			varchar(20),
	 States			varchar(20),
	 Member_phno		numeric(10),
	 Member_Email 		varchar(20),
	 Member_DOB		Date,
	 primary key (Member_ID), 
	 foreign key (Librarian_ID) references Librarian (Librarian_ID)
		on delete set null
	);



create table Journal
	(Issue_No		varchar(7),
	 Author_ID		varchar(7),
	 Publisher_ID		varchar(7),
	 J_Title		char(30),	
	 J_Genre		char(30),			
	 primary key (Issue_No),
	 foreign key (Author_ID) references Author (Author_ID)
		on delete set null,
	 foreign key (Publisher_ID) references Publisher (Publisher_ID)
		on delete set null
	 );


create table Book
	(Book_ID		varchar(7),
	 Author_ID		varchar(7),
	 Publisher_ID		varchar(7),
	 B_Title		char(30),	
	 B_Genre		char(30),			
	 Book_Edition		varchar(10),
	 No_of_copies 		numeric(2),
	 primary key (Book_ID),
	 foreign key (Author_ID) references Author (Author_ID)
		on delete set null,
	 foreign key (Publisher_ID) references Publisher (Publisher_ID)
		on delete set null
	 );


create table Documents 
	(Book_ID		varchar(7),
	 Document_ID 		varchar(7),
	 Issue_no		varchar(7),
	 Issue_ID		varchar(7),
	 Availability		char(1) check (Availability = 'Y' or Availability = 'N' ),	
	 Levels			numeric(1,0) check (Levels > 0 and Levels < 10),
	 primary key (Document_ID),
	 foreign key (Book_ID) references Book (Book_ID)
		on delete set null,
	 foreign key (Issue_no) references Journal (Issue_no)
		on delete set null,
	 foreign key (Issue_ID) references Magazine (Issue_ID)
		on delete set null
	 );


create table Report
	(Report_ID		varchar(7),
	 Librarian_ID		varchar(7),
	 Document_ID		varchar(7),
	 Member_ID		varchar(7),
	 Date_of_Borrow		Date,
	 Date_of_Return		Date,
	 primary key (Report_ID),
	 foreign key (Document_ID) references Documents (Document_ID)
		on delete set null,
	 foreign key (Librarian_ID) references Librarian (Librarian_ID)
		on delete set null,
	 foreign key (Member_ID) references Member (Member_ID)
		on delete set null
	);

create table Due
	(Due_ID			varchar(15),
	 Member_ID		varchar(7),
	 Due_Date		Date,
	 primary key (Due_ID),
	 foreign key (Member_ID) references Member (Member_ID)
		on delete set null
	 );



create table Copy
	(Document_ID		varchar(7),
	 Added_By		char(20),
	 Copy_Status		char(1) check (Copy_Status = 'Y' or Copy_Status = 'N' ),
	 Locations		char(30),	
	 Category		char(30),			
	 Last_Updated 		Date,
	 primary key (Document_ID),
	 foreign key (Document_ID) references Documents (Document_ID)
		on delete set null
	 );

create table Authentication
	(Librarian_ID		varchar(7),
	 Username		char(20),
	 Passwords		varchar(30),
	 primary key (Librarian_ID),
	 foreign key (Librarian_ID) references Librarian (Librarian_ID)
		on delete set null
	 );

create table Takes_From
	(Report_ID		varchar(7),
	 Document_ID		varchar(7),
	 primary key (Report_ID,Document_ID),
	 foreign key (Report_ID) references Report (Report_ID)
		on delete set null,
	 foreign key (Document_ID) references Documents (Document_ID)
		on delete set null
	 );

create table Searches
	(Member_ID		varchar(7),
	 Document_ID		varchar(7),
	 primary key (Member_ID,Document_ID),
	 foreign key (Member_ID) references Member (Member_ID)
		on delete set null,
	 foreign key (Document_ID) references Documents (Document_ID)
		on delete set null
	 );

create table Written_By
	(Book_ID		varchar(7),
	 Author_ID		varchar(7),
	 Issue_No		varchar(7),
	 primary key (Book_ID,Author_ID,Issue_No),
	 foreign key (Book_ID) references Book (Book_ID)
		on delete set null,
	 foreign key (Author_ID) references Author (Author_ID)
		on delete set null,
	 foreign key (Issue_No) references Journal (Issue_No)
		on delete set null
	 );


create table Published_In 
	(Publisher_ID		varchar(7),
	 Issue_No		varchar(7),
	 primary key (Publisher_ID,Issue_No),
	 foreign key (Publisher_ID) references Publisher (Publisher_ID)
		on delete set null,
	 foreign key (Issue_No) references Journal (Issue_No)
		on delete set null
	 );


create table Published_By 
	(Book_ID		varchar(7),
	 Publisher_ID		varchar(7),
	 Issue_ID		varchar(7),
	 primary key (Book_ID,Publisher_ID,Issue_ID),
	 foreign key (Book_ID) references Book (Book_ID)
		on delete set null,
	 foreign key (Publisher_ID) references Publisher (Publisher_ID)
		on delete set null,
	 foreign key (Issue_ID) references Magazine (Issue_ID)
		on delete set null
	 );

create table Log_In 
	(Librarian_ID		varchar(7),
	 primary key (Librarian_ID),
	 foreign key (Librarian_ID) references Librarian (Librarian_ID)
		on delete set null
	 );

































































