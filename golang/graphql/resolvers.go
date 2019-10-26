package graphql

import (
	"strconv"

	"github.com/Gezele14/Proyecto2-SOA/golang/sql"

	"github.com/graphql-go/graphql"
)

// Resolver struct holds a connection to our database
type Resolver struct {
	db *sql.Db
}

// OrderResolver resolves our user query through a db call to GetOrders
func (r *Resolver) OrderResolver(p graphql.ResolveParams) (interface{}, error) {
	// Strip the name from arguments and assert that it's a string
	idRestaurant, ok := p.Args["idRestaurant"].(int)
	idClient, ok1 := p.Args["idClient"].(int)

	if ok {
		orders := r.db.GetOrdersByAttribute(strconv.Itoa(idRestaurant), "idRestaurant")
		return orders, nil
	} else if ok1 {
		orders := r.db.GetOrdersByAttribute(strconv.Itoa(idClient), "idClient")
		return orders, nil
	}

	orders := r.db.GetOrdersByAttribute("", "none")

	return orders, nil
}

// OrderCreator resolves our user query through a db call to CreateOrder
func (r *Resolver) OrderCreator(p graphql.ResolveParams) (interface{}, error) {
	// Strip the name from arguments and assert that it's a string
	idRestaurant, _ := p.Args["idRestaurant"].(int)
	idClient, _ := p.Args["idClient"].(int)

	order := r.db.CreateOrder(idRestaurant, idClient)

	return order, nil
}

// OrderDeleter resolves our user query through a db call to DeleteOrder
func (r *Resolver) OrderDeleter(p graphql.ResolveParams) (interface{}, error) {
	// Strip the name from arguments and assert that it's a string
	idOrder, _ := p.Args["idOrder"].(int)

	rowsAffected := r.db.DeleteOrder(idOrder)

	return rowsAffected, nil
}

// OrderUpdater resolves our user query through a db call to UpdateOrder
func (r *Resolver) OrderUpdater(p graphql.ResolveParams) (interface{}, error) {
	// Strip the name from arguments and assert that it's a string
	idOrder, _ := p.Args["idOrder"].(int)
	newClientID, _ := p.Args["newClientId"].(int)

	rowsAffected := r.db.UpdateOrder(idOrder, newClientID)

	return rowsAffected, nil
}