CREATE DATABASE Seminar3;

USE Seminar3;

CREATE TABLE Orders (
idOrders int PRIMARY KEY AUTO_INCREMENT,
ordersName varchar(40) NOT NULL,
ordersPrice int NOT NULL,
dataOrder date NOT NULL,
recipient varchar (40) NOT NULL,
city varchar (50));

# 1. Напишите запрос, который сосчитал бы все суммы 
# заказов, выполненных 1 января 2016 года.

SELECT dataOrder, SUM(ordersPrice) as sumSales
FROM Orders
WHERE dataOrder = '2016-01-01'

# 2. Напишите запрос, который сосчитал бы число различных, 
# отличных от NULL значений поля  city в таблице заказчиков.

SELECT COUNT(DISTINCT city) as nnull
FROM Orders;

# 3. Напишите запрос, который выбрал бы наименьшую 
# сумму для каждого заказчика.

SELECT MIN(ordersPrice) as min,recipient
FROM Orders
GROUP BY recipient;


# 4.  Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы Г.
# Используется оператор "LIKE":

SELECT recipient
FROM Orders
WHERE recipient LIKE 'Г%'
ORDER BY recipient;


# 5. Напишите запрос, который выбрал бы высший рейтинг в каждом городе.

SELECT city, COUNT(city) AS rating
FROM Orders
GROUP BY city
HAVING rating > 0;


CREATE DATABASE seminar3_1;
USE seminar3_1;


CREATE TABLE Workers (
id int primary key auto_increment,
name varchar (20) not null,
surname varchar (20) not null,
speciality varchar (20) not null,
seniority int not null,
salary int not null,
age int not null);

INSERT Workers(name, surname,speciality, seniority, salary, age)
VALUES
('Вася', 'Васькин', 'начальник', 40, 100000, 60),
('Петя', 'Петькин', 'начальник', 8, 70000, 30),
('Катя', 'Катькина', 'инженер', 2, 70000, 25),
('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
('Петр', 'Петров', 'рабочий', 20, 25000, 40),
('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
('Люся', 'Люськина', 'уборщик', 10, 10000, 49);

SELECT * FROM Workers

# 1. Отсортируйте поле “зарплата” по убыванию и возрастания

SELECT * FROM Workers
ORDER BY salary;

SELECT * FROM Workers
ORDER BY salary DESC;

# 2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой

SELECT * FROM 
(SELECT * FROM Workers ORDER BY salary DESC LIMIT 5) 
AS salary ORDER BY salary;


# 3. Выполните группировку всех сотрудников по специальности “рабочий”, зарплата которых превышает 20000

SELECT * 
FROM Workers
WHERE speciality = 'рабочий' 
AND salary > 20000
GROUP BY speciality;
