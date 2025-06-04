CREATE TABLE Restaurant (
    restaurantId NUMBER PRIMARY KEY,
    restaurantName VARCHAR2(30),
    city VARCHAR2(30),
    email VARCHAR2(30),
    mobile VARCHAR2(15),
    rating NUMBER(9,2)
);

CREATE TABLE RestaurantBackup (
    RbId NUMBER PRIMARY KEY,
    restaurantId NUMBER,
    restaurantName VARCHAR2(30),
    city VARCHAR2(30),
    email VARCHAR2(30),
    mobile VARCHAR2(15),
    rating NUMBER(9,2),
    operation VARCHAR2(30),
    activityOn DATE DEFAULT SYSDATE
);

CREATE SEQUENCE RestaurantBackup_seq START WITH 1 INCREMENT BY 1;

-- Add Restuarant
CREATE OR REPLACE PROCEDURE AddRestaurant AS
BEGIN
    INSERT INTO Restaurant VALUES (1, 'Spice Factory', 'Pune', 'spice@gmail.com', '9876543210', 4.5),
    (2, 'Shandaar', 'Pune', 'shandaar@gmail.com', '9876543211', 4.0);
    dbms_output.put_line('Restaurant added successfully!');
END;
/

-- searchbyId
CREATE OR REPLACE PROCEDURE SearchByRestaurantId AS
    rid number := 1;
    rname varchar2(30);
    city varchar2(30);
    email varchar2(30);
    mobile varchar2(15);
    rating number(9,2);
BEGIN
    SELECT restaurantName, city, email, mobile, rating INTO rname, city, email, mobile, rating
    FROM Restaurant
    WHERE restaurantId = rid;

    dbms_output.put_line('Name: ' || rname);
    dbms_output.put_line('City: ' || city);
    dbms_output.put_line('Email: ' || email);
    dbms_output.put_line('Mobile: ' || mobile);
    dbms_output.put_line('Rating: ' || rating);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Restaurant not found.');
END;
/

-- update restaurant
CREATE OR REPLACE PROCEDURE UpdateRestaurant AS
BEGIN
    UPDATE Restaurant
    SET city = 'Mumbai', rating = 4.8
    WHERE restaurantId = 1;

    dbms_output.put_line('Restaurant updated successfully');
END;
/

-- delete restaurant
CREATE OR REPLACE PROCEDURE DeleteRestaurantById AS
BEGIN
    DELETE FROM Restaurant
    WHERE restaurantId = 1;

    dbms_output.put_line('Restaurant deleted successfully');
END;
/

SET SERVEROUTPUT ON;
/

-- cursor to print all restaurant details
DECLARE
    CURSOR rest_cursor IS SELECT * FROM Restaurant;
    r Restaurant%ROWTYPE;
BEGIN
    OPEN rest_cursor;
    LOOP
        FETCH rest_cursor INTO r;
        EXIT WHEN rest_cursor%NOTFOUND;
        dbms_output.put_line('ID: ' || r.restaurantId || ', Name: ' || r.restaurantName || ', City: ' || r.city || ', Rating: ' || r.rating);
    END LOOP;
    CLOSE rest_cursor;
END;
/

-- procedure - searchrestaurantbyid
CREATE OR REPLACE PROCEDURE SearchRestaurantById (
    rname OUT varchar2,
    rcity OUT varchar2
) AS
BEGIN
    SELECT restaurantName, city INTO rname, rcity
    FROM Restaurant
    WHERE restaurantId = 1;
END;
/

-- usage of procedure
DECLARE
    name varchar2(30);
    city varchar2(30);
BEGIN
    SearchRestaurantById(name, city);
    dbms_output.put_line('Name: ' || name || ', City: ' || city);
END;
/

-- trigger for insert
CREATE OR REPLACE TRIGGER trg_after_insert
AFTER INSERT ON Restaurant
FOR EACH ROW
BEGIN
    INSERT INTO RestaurantBackup (RbId, restaurantId, restaurantName, city, email, mobile, rating, operation)
    VALUES (RestaurantBackup_seq.NEXTVAL, :NEW.restaurantId, :NEW.restaurantName, :NEW.city, :NEW.email, :NEW.mobile, :NEW.rating, 'INSERT');
END;
/

-- Trigger for update
CREATE OR REPLACE TRIGGER trg_after_update
AFTER UPDATE ON Restaurant
FOR EACH ROW
BEGIN
    INSERT INTO RestaurantBackup (RbId, restaurantId, restaurantName, city, email, mobile, rating, operation)
    VALUES (RestaurantBackup_seq.NEXTVAL, :OLD.restaurantId, :OLD.restaurantName, :OLD.city, :OLD.email, :OLD.mobile, :OLD.rating, 'UPDATE');
END;
/

-- Trigger for delete
CREATE OR REPLACE TRIGGER trg_after_delete
AFTER DELETE ON Restaurant
FOR EACH ROW
BEGIN
    INSERT INTO RestaurantBackup (RbId, restaurantId, restaurantName, city, email, mobile, rating, operation)
    VALUES (RestaurantBackup_seq.NEXTVAL, :OLD.restaurantId, :OLD.restaurantName, :OLD.city, :OLD.email, :OLD.mobile, :OLD.rating, 'DELETE');
END;
/

-- Testing All

-- Add a restaurant
BEGIN
    AddRestaurant;
END;
/

-- View restaurant details
BEGIN
    SearchByRestaurantId;
END;
/

-- Update restaurant
BEGIN
    UpdateRestaurant;
END;
/

-- View again to see changes
BEGIN
    SearchByRestaurantId;
END;
/

-- Delete restaurant
BEGIN
    DeleteRestaurantById;
END;
/

-- Check backup log
SELECT * FROM RestaurantBackup;
