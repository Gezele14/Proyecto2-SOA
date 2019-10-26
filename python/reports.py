from app import app
from flask import jsonify, request
 
import mysql.connector as mySql #Database conector needed
import csv #for CSVs

# Database connection 
soaDatabase = mySql.connect(
    host="192.168.219.98",
    user="root",
    password="123456",
    database="restDB"
)
reportService = soaDatabase.cursor()

#GET method:
# Get the orders by users id
@app.route('/report/orders/users/<int:id>')
def byUser(id):
    try:
        byUsers = ("SELECT restaurants.name, provinces.name, orders.orderDate, users.userName, clients.name, clients.lastName "
        + "FROM restaurantsXorders "
        + "JOIN restaurants ON restaurantsXorders.idRestaurants = restaurants.idRestaurants " 
        + "JOIN orders ON restaurantsXorders.idOrders = orders.idOrders " 
        + "JOIN provinces ON restaurants.idProvinces = provinces.idProvinces "
        + "JOIN usersxorders ON orders.idOrders = usersxorders.idOrders "
        + "JOIN users ON users.idUsers = usersxorders.idUsers "
        + "JOIN clients ON users.idClients = clients.idClients "
        + "WHERE users.idUsers = " + str(id))
        reportService.execute(byUsers)
        rows = reportService.fetchall()
        response = jsonify(rows)
        response.status_code = 200
        # CSVs generator
        with open("OrdersByUser.csv", "w", newline='') as f:
            writer = csv.writer(f)
            writer.writerow(["Restaurante","Provincia","Fecha de orden","Usuario","Nombre","Apellido"])
            writer.writerows(rows)
        return response
    except Exception as e:
        print(e)

#GET method:
# Get the orders by restaurant id
@app.route('/report/orders/restaurants/<int:id>')
def byRestaurant(id):
    try:
        byRest = ("SELECT restaurants.name, provinces.name, orders.orderDate, orders.details "
        + "FROM restaurantsXorders "
        + "JOIN restaurants ON restaurantsXorders.idRestaurants = restaurants.idRestaurants " 
        + "JOIN orders ON restaurantsXorders.idOrders = orders.idOrders " 
        + "JOIN provinces ON restaurants.idProvinces = provinces.idProvinces "
        + "WHERE restaurants.idRestaurants = " + str(id))
        reportService.execute(byRest)
        rows = reportService.fetchall()
        response = jsonify(rows)
        response.status_code = 200
        # CSVs generator
        with open("OrdersByRestaurant.csv", "w", newline='') as f:
            writer = csv.writer(f)
            writer.writerow(["Restaurante","Provincia","Fecha de orden", "Detalles"])
            writer.writerows(rows)
        return response
    except Exception as e:
        print(e)

#GET method:
# Get the orders of a restaurant by year
@app.route('/report/orders/restaurants/year/<int:year>')
def byYear(year):
    try:
        byYear = ("SELECT restaurants.name, provinces.name, orders.orderDate "
        + "FROM restaurantsXorders "
        + "JOIN restaurants ON restaurantsXorders.idRestaurants = restaurants.idRestaurants " 
        + "JOIN orders ON restaurantsXorders.idOrders = orders.idOrders " 
        + "JOIN provinces ON restaurants.idProvinces = provinces.idProvinces "
        + "WHERE YEAR(orders.orderDate) = " + str(year))
        reportService.execute(byYear)
        rows = reportService.fetchall()
        response = jsonify(rows)
        response.status_code = 200
        # CSVs generator
        with open("OrdersByYear.csv", "w", newline='') as f:
            writer = csv.writer(f)
            writer.writerow(["Restaurante","Provincia","Fecha de orden"])
            writer.writerows(rows)
        return response
    except Exception as e:
        print(e)

#GET method:
# Get the orders of a restaurant by month
@app.route('/report/orders/restaurants/month/<int:month>')
def byMonth(month):
    try:
        byMonth = ("SELECT restaurants.name, provinces.name, orders.orderDate "
        + "FROM restaurantsXorders "
        + "JOIN restaurants ON restaurantsXorders.idRestaurants = restaurants.idRestaurants " 
        + "JOIN orders ON restaurantsXorders.idOrders = orders.idOrders " 
        + "JOIN provinces ON restaurants.idProvinces = provinces.idProvinces "
        + "WHERE MONTH(orders.orderDate) = " + str(month))
        reportService.execute(byMonth)
        rows = reportService.fetchall()
        response = jsonify(rows)
        response.status_code = 200
        # CSVs generator
        with open("OrdersByMonth.csv", "w", newline='') as f:
            writer = csv.writer(f)
            writer.writerow(["Restaurante","Provincia","Fecha de orden"])
            writer.writerows(rows)
        return response
    except Exception as e:
        print(e)

#GET method:
# Get the orders of a restaurant by day
@app.route('/report/orders/restaurants/day/<int:day>')
def byDay(day):
    try:
        byDay = ("SELECT restaurants.name, provinces.name, orders.orderDate "
        + "FROM restaurantsXorders "
        + "JOIN restaurants ON restaurantsXorders.idRestaurants = restaurants.idRestaurants " 
        + "JOIN orders ON restaurantsXorders.idOrders = orders.idOrders " 
        + "JOIN provinces ON restaurants.idProvinces = provinces.idProvinces "
        + "WHERE DAY(orders.orderDate) = " + str(day))
        reportService.execute(byDay)
        rows = reportService.fetchall()
        response = jsonify(rows)
        response.status_code = 200
        # CSVs generator
        with open("OrdersByDay.csv", "w", newline='') as f:
            writer = csv.writer(f)
            writer.writerow(["Restaurante","Provincia","Fecha de orden"])
            writer.writerows(rows)
    except Exception as e:
        print(e)

#Handler
@app.errorhandler(404)
def not_found(error=None):
    message = {
        'status': 404,
        'message': 'Not Found: ' + request.url,
    }
    response = jsonify(message)
    response.status_code = 404
    return response

if __name__ == "__main__":
    app.run()