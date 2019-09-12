DROP TABLE IF EXISTS [taverns];

CREATE TABLE [taverns] (
    id INT NOT NULL IDENTITY(1, 1),
    tavern_name VARCHAR(256) NOT NULL,
    tavern_address VARCHAR(256) NOT NULL,
    owner_id INT NOT NULL,
    tavern_floors INT NOT NULL
);

DROP TABLE IF EXISTS [owners];

CREATE TABLE [owners] (
    id INT NOT NULL IDENTITY(1,1),
    owner_name VARCHAR(256) NOT NULL,
    role_id INT NOT NULL
);

DROP TABLE IF EXISTS [rats];

CREATE TABLE [rats] (
    id INT NOT NULL IDENTITY(1,1),
    rat_name VARCHAR(256) NOT NULL,
    tavern_id INT NOT NULL
);

DROP TABLE IF EXISTS [roles];

CREATE TABLE [roles] (
    id INT NOT NULL IDENTITY(1,1),
    role_name VARCHAR(256) NOT NULL,
    role_description VARCHAR(256) NOT NULL
);

DROP TABLE IF EXISTS [supplies];

CREATE TABLE [supplies] (
    id INT NOT NULL IDENTITY(1,1),
    unit VARCHAR(256) NOT NULL,
    supply_name VARCHAR(256) NOT NULL
);

DROP TABLE IF EXISTS [inventory];

CREATE TABLE [inventory] (
    id INT NOT NULL IDENTITY(1,1),
    supply_id INT NOT NULL,
    tavern_id INT NOT NULL,
    date_updated DATETIME NOT NULL,
    current_amount INT NOT NULL
);

DROP TABLE IF EXISTS [receiving];

CREATE TABLE [receiving] (
    id INT NOT NULL IDENTITY(1,1),
    supply_id INT NOT NULL,
    tavern_id INT NOT NULL,
    cost FLOAT NOT NULL,
    amount_received INT NOT NULL,
    date_received DATETIME NOT NULL
);

DROP TABLE IF EXISTS [services];

CREATE TABLE [services] (
    id INT NOT NULL IDENTITY(1,1),
    services_name VARCHAR(256) NOT NULL
);

DROP TABLE IF EXISTS [service_status];

CREATE TABLE [service_status] (
    id INT NOT NULL IDENTITY(1,1),
    service_id INT NOT NULL,
    active BIT NOT NULL,
    inactive BIT NOT NULL
);

DROP TABLE IF EXISTS [sales];

CREATE TABLE [sales] (
    id INT NOT NULL IDENTITY(1,1),
    service_id INT NOT NULL,
    guest_id INT NOT NULL,
    price FLOAT NOT NULL,
    date_purchased DATETIME NOT NULL,
    amount_purchased INT NOT NULL,
    tavern_id INT NOT NULL
);


INSERT INTO [taverns] (
    [id],
    [tavern_name],
    [tavern_address],
    [owner_id],
    [tavern_floors]
)
VALUES
    (1, 'Village Pub', '1 Village Center Drive', 1, 1),
    (2, 'Harpers Pub', '34 Old Towne Road', 2, 2),
    (3, 'Macks', '17 Main Street', 3, 1),
    (4, 'Sallys Saloon', '54 Madison Avenue', 4, 3),
    (5, 'The Watering Hole', '3 Tree Street', 5, 2);

INSERT INTO [inventory] (
    [supply_id],
    [tavern_id],
    [date_updated],
    [current_amount]
)
VALUES
    (1, 1, '9/10/2019', 55),
    (2, 2, '9/05/2019', 80),
    (3, 3, '8/24/2019', 70),
    (4, 4, '8/24/2019', 45),
    (5, 5, '9/05/2019', 60);

INSERT INTO [owners] (
    [owner_name],
    [role_id]
)
VALUES
    ('Charles Ownerson', '1'),
    ('Steven MyPlace', '2'),
    ('Eric Taverson', '3'),
    ('Jacob Smith', '4'),
    ('Frank Ford', '5'),
    ('Jacob Smith', '1'),
    ('Frank Ford', '2');

INSERT INTO [rats] (
    [rat_name],
    [tavern_id]
)
VALUES
    ('Screechy', 1),
    ('Cheddar', 2),
    ('Chuck', 3),
    ('Leo', 4),
    ('Taco', 5),
    ('Tweek', 6),
    ('Chuck', 7);

INSERT INTO [receiving] (
    [supply_id],
    [tavern_id],
    [cost],
    [amount_received],
    [date_received]
)
VALUES
    (1, 1, 3.99, 10, '9/10/2019'),
    (2, 2, 5.99, 15, '9/05/2019'),
    (3, 3, 6.75, 20, '8/24/2019'),
    (4, 4, 10.99, 35, '8/24/2019'),
    (5, 5, 13.50, 25, '9/05/2019');

INSERT INTO [roles] (
    [role_name],
    [role_description]
)
VALUES
    ('Manager', 'Manages daily operations of the tavern. Oversees other employees and reports to Owner'),
    ('Owner', 'Owns the tavern. Oversees financial and back-office operations. Makes key decision for the business'),
    ('Waiter', 'Provides customer service. Takes food order, delivers food, cleans tables.'),
    ('Head Bartender', 'Manages the bar area, takes and delivers drink orders, and provides excellent customer service'),
    ('Head Cook', 'Manages the kitchen area and other cooks. Oversees culinary operations');

INSERT INTO [sales] (
    [service_id],
    [guest_id],
    [price],
    [date_purchased],
    [amount_purchased],
    [tavern_id]
)
VALUES
    (1, 1, 50.00, '8/30/2019', 6, 1),
    (2, 2, 45.00, '8/31/2019', 4, 2),
    (3, 3, 65.00, '9/01/2019', 7, 3),
    (4, 4, 25.00, '9/02/2019', 2, 4),
    (5, 5, 70.00, '9/03/2019', 8, 5);

INSERT INTO [service_status] (
    [service_id],
    [active],
    [inactive]
)
VALUES
    (1, 0, 1),
    (2, 0, 1),
    (3, 0, 1),
    (4, 1, 0),
    (5, 1, 0);

INSERT INTO [services] (
    [services_name]
)
VALUES
    ('Gambling'),
    ('Food Service'),
    ('Weapon Sharpening'),
    ('Inn'),
    ('Horse Feeding');

INSERT INTO [supplies] (
    [unit],
    [supply_name]
)
VALUES
    ('Bottles', 'Ketchup'),
    ('Case', 'Salt Shakers'),
    ('Ounce', 'Chicken Breast'),
    ('Keg', 'Beer'),
    ('Ounce', 'Steak');
