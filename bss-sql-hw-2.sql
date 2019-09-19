DROP TABLE IF EXISTS [rats];
DROP TABLE IF EXISTS [guests];
DROP TABLE IF EXISTS [guest_status];
DROP TABLE IF EXISTS [classes];
DROP TABLE IF EXISTS [levels];
DROP TABLE IF EXISTS [supply_sales];

CREATE TABLE [guests] (
	id INT IDENTITY(1,1) NOT NULL,
	guest_name VARCHAR(256) NOT NULL,
	notes VARCHAR(500) NULL,
	birthday DATETIME NULL,
	cakeday DATETIME NULL,
	status_id INT NOT NULL
);

CREATE TABLE [guest_status] (
	id INT IDENTITY(1,1) NOT NULL,
	guest_status VARCHAR(256)
);

CREATE TABLE [classes] (
	id INT IDENTITY(1,1) NOT NULL,
	class_name VARCHAR(256)
);

CREATE TABLE [levels] (
	id INT IDENTITY(1,1) NOT NULL,
	guest_id INT NOT NULL,
	class_id INT NOT NULL,
	class_level INT NOT NULL
);

CREATE TABLE [supply_sales] (
	id INT IDENTITY(1,1) NOT NULL,
	supply_id INT NOT NULL,
	guest_id INT NOT NULL,
	tavern_id INT NOT NULL
);

/* Add primary keys */
ALTER TABLE [inventory] ADD PRIMARY KEY (id);
ALTER TABLE [owners] ADD PRIMARY KEY (id);
ALTER TABLE [receiving] ADD PRIMARY KEY (id);
ALTER TABLE [roles] ADD PRIMARY KEY (id);
ALTER TABLE [sales] ADD PRIMARY KEY (id);
ALTER TABLE [service_status] ADD PRIMARY KEY (id);
ALTER TABLE [services] ADD PRIMARY KEY (id);
ALTER TABLE [supplies] ADD PRIMARY KEY (id);
ALTER TABLE [taverns] ADD PRIMARY KEY (id);
ALTER TABLE [guests] ADD PRIMARY KEY (id);
ALTER TABLE [classes] ADD PRIMARY KEY (id);
ALTER TABLE [levels] ADD PRIMARY KEY (id);
ALTER TABLE [supply_sales] ADD PRIMARY KEY (id);
ALTER TABLE [guest_status] ADD PRIMARY KEY (id);

/* Add foreign keys */
ALTER TABLE [taverns] ADD FOREIGN KEY (owner_id) REFERENCES [owners](id);
ALTER TABLE [owners] ADD FOREIGN KEY (role_id) REFERENCES [roles](id);
ALTER TABLE [inventory] ADD FOREIGN KEY (supply_id) REFERENCES [supplies](id);
ALTER TABLE [inventory] ADD FOREIGN KEY (tavern_id) REFERENCES [taverns](id);
ALTER TABLE [receiving] ADD FOREIGN KEY (supply_id) REFERENCES [supplies](id);
ALTER TABLE [receiving] ADD FOREIGN KEY (tavern_id) REFERENCES [taverns](id);
ALTER TABLE [sales] ADD FOREIGN KEY (service_id) REFERENCES [services](id);
ALTER TABLE [sales] ADD FOREIGN KEY (guest_id) REFERENCES [guests](id);
ALTER TABLE [sales] ADD FOREIGN KEY (tavern_id) REFERENCES [taverns](id);
ALTER TABLE [service_status] ADD FOREIGN KEY (service_id) REFERENCES [services](id);
ALTER TABLE [guests] ADD FOREIGN KEY (status_id) REFERENCES [guest_status](id);
ALTER TABLE[levels] ADD FOREIGN KEY (guest_id) REFERENCES [guests](id);
ALTER TABLE[levels] ADD FOREIGN KEY (class_id) REFERENCES [classes](id);
ALTER TABLE [supply_sales] ADD FOREIGN KEY (supply_id) REFERENCES [supplies](id);
ALTER TABLE [supply_sales] ADD FOREIGN KEY (guest_id) REFERENCES [guests](id);
ALTER TABLE [supply_sales] ADD FOREIGN KEY (tavern_id) REFERENCES [taverns](id);

INSERT INTO [guest_status] (guest_status)
VALUES
	('sick'),
	('fine'),
	('hangry'),
	('raging'),
	('placid');

INSERT INTO [guests] (
	guest_name,
	notes,
	birthday,
	cakeday,
	status_id)
VALUES
	('Timmy', 'Bought lots of food', '6/25/1993', '7/1/2003', 2),
	('James', 'Left a huge mess', '7/03/1994', '7/06/200', 3),
	('Joey', 'What a guy', '4/15/1995', '8/08/2008', 1),
	('Wallace', 'The Wally Man', '2/13/1997', '9/16/2004', 5),
	('Jenny', 'Jenny from the block', '2/27/1991', '6/24/2000', 4);

INSERT INTO [classes] (class_name)
VALUES
	('Fighter'),
	('Paladin'),
	('Wizard'),
	('Necromancer'),
	('Rogue'),
	('Demon Slayer'),
	('Ranger'),
	('Druid');

INSERT INTO [levels] (
	guest_id,
	class_id,
	class_level)
VALUES
	(1, 5, 5),
	(1, 6, 5),
	(2, 8, 3),
	(2, 7, 2),
	(3, 4, 6),
	(3, 3, 1),
	(4, 3, 7),
	(4, 2, 7),
	(5, 1, 10);

INSERT INTO [supply_sales] (
	supply_id,
	guest_id,
	tavern_id
)
VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3),
	(4, 4, 4),
	(5, 5, 5);

/* Will Fail for testing

INSERT INTO [levels] (
	guest_id,
	class_id,
	class_level
)
VALUES
	(15,15,15),
	(14,14,14);

INSERT INTO [supply_id] (
	supply_id,
	guest_id,
	tavern_id
)
VALUES
	(15,15,15),
	(14,14,14);

*/
