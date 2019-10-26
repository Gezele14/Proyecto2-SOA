package database

import (
	"database/sql"
	"fmt"
	"time"

	//mysql driver
	_ "github.com/go-sql-driver/mysql"
)

// Db is our database struct used for interacting with the database
type Db struct {
	*sql.DB
}

// New makes a new database using the connection string and
// returns it, otherwise returns the error
func New(connString string) (*Db, error) {
	db, err := sql.Open("mysql", connString)
	if err != nil {
		return nil, err
	}

	// Check that our connection is good
	err = db.Ping()
	if err != nil {
		return nil, err
	}

	return &Db{db}, nil
}

// Client shape
type Client struct {
	IDClient       int
	identification string
	FName          string
	LName          string
	Address        string
	email          string
	phone          string
	IDprovince     string
}

//User shape
type User struct {
	IDUser   int
	Name     string
	Password string
	IDClient Client
}

//Restaurant shape
type Restaurant struct {
	IDRestaurant      int
	Name              string
	Address           string
	DisponibilityDays string
	IDprovinces       string
	ContactNumber     string
}

// Order shape
type Order struct {
	Restaurant Restaurant
	OrderDate  time.Time
	Details    string
	User       User
	Client     Client
}

// GetOrdersByAttribute is called within our user query for graphql
func (d *Db) GetOrders(name string, col string) []Order {
	var query string
	if col != "none" {
		query = "SELECT restaurant, orderDate, details, userName, client, lastName FROM orders_view; WHERE soa.orders." + col + "=" + name
	} else {
		query = "SELECT restaurant, orderDate, details, userName, client, lastName FROM orders_view;"
	}
	stmt, err := d.Prepare(query)
	if err != nil {
		fmt.Println("GetOrders Preperation Err: ", err)
	}

	// Make query with our stmt, passing in name argument
	rows, err := stmt.Query()
	if err != nil {
		fmt.Println("GetOrders Query Err: ", err)
	}

	// Create User struct for holding each row's data
	var client Client
	var user User
	var rest Restaurant
	var order Order
	var date string
	preset := "2006-01-02 15:04:05"
	// Create slice of Client for our response
	orders := []Order{}
	// Copy the columns from row into the values pointed at by r (Client)
	for rows.Next() {
		err = rows.Scan(
			&rest.Name,
			&date,
			&order.Details,
			&user.Name,
			&client.FName,
			&client.LName,
		)
		order.Restaurant = rest
		order.User = user
		order.Client = client
		order.OrderDate, _ = time.Parse(preset, date)
		if err != nil {
			fmt.Println("Error scanning rows: ", err)
		}
		orders = append(orders, order)
	}

	return orders
}

// CreateOrder is called within our createOrder mutation for graphql
func (d *Db) CreateOrder(orderDate string, details string, idRestaurant int) Order {
	var query = "INSERT INTO orders (orderDate, details, idRestaurant) VALUES (?, ?, ?)"
	stmt, err := d.Prepare(query)
	if err != nil {
		fmt.Println("CreateOrder Preperation Err: ", err)
	}
	// Executes te insert
	_, error := stmt.Exec(orderDate, details, idRestaurant)
	if error != nil {
		fmt.Println("CreateOrder Query Err: ", err)
	}

	var order Order

	return order
}

// DeleteOrder is called within our user query for graphql
func (d *Db) DeleteOrder(idOrder int) int {
	var query = "DELETE FROM orders WHERE idOrder = ?"
	stmt, err := d.Prepare(query)
	if err != nil {
		fmt.Println("DeleteOrder Preperation Err: ", err)
	}
	// Make query with our stmt, passing in name argument
	res, err := stmt.Exec(idOrder)
	if err != nil {
		fmt.Println("DeleteOrder Query Err: ", err)
	}

	rowsAffected, _ := res.RowsAffected()

	return int(rowsAffected)
}

// UpdateOrder is called within our user query for graphql
func (d *Db) UpdateOrder(idOrder int, idRestaurants int) int {
	var query = "UPDATE orders SET idRestaurants = ? WHERE idOrder = ?"
	stmt, err := d.Prepare(query)
	if err != nil {
		fmt.Println("UpdateOrder Preperation Err: ", err)
	}
	// Make query with our stmt, passing in name argument
	res, err := stmt.Exec(idRestaurants, idOrder)
	if err != nil {
		fmt.Println("UpdateOrder Query Err: ", err)
	}

	rowsAffected, _ := res.RowsAffected()

	return int(rowsAffected)
}
