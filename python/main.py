from app import app
from flask import jsonify, request


import mysql.connector

# Database connection 
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    passwd="123456",
    database="SOA4ID"
)

reportService = mydb.cursor()



@app.route('/orders')
def orders():
    try:
        queryOrders = ("SELECT restaurants.name, provinces.name, orders.orderDate, orders.details "
        + "FROM restaurantsXorders "
        + "JOIN restaurants ON restaurantsXorders.idRestaurants = restaurants.idRestaurants " 
        + "JOIN orders ON restaurantsXorders.idOrders = orders.idOrders " 
        + "JOIN provinces ON restaurants.idProvinces = provinces.idProvinces")
        reportService.execute(queryOrders)
        rows = reportService.fetchall()
        resp = jsonify(rows)
        resp.status_code = 200
        return resp
    except Exception as e:
        print(e)


@app.errorhandler(404)
def not_found(error=None):
    message = {
        'status': 404,
        'message': 'Not Found: ' + request.url,
    }
    resp = jsonify(message)
    resp.status_code = 404

    return resp


if __name__ == "__main__":
    app.run()