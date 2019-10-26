package graphqlquery

import (
	"strconv"

	"github.com/Gezele14/Proyecto2-SOA/golang/database"
	"github.com/graphql-go/graphql"
)

// Resolver struct holds a connection to our database
type Resolver struct {
	db *database.Db
}

// OrderResolver resolves our user query through a db call to GetOrders
func (r *Resolver) OrderResolver(p graphql.ResolveParams) (interface{}, error) {
	// Strip the name from arguments and assert that it's a string
	idRestaurant, ok := p.Args["idRestaurant"].(int)
	idClient, ok1 := p.Args["idClient"].(int)

	if ok {
		orders := r.db.GetOrders(strconv.Itoa(idRestaurant), "idRestaurant")
		return orders, nil
	} else if ok1 {
		orders := r.db.GetOrders(strconv.Itoa(idClient), "idClient")
		return orders, nil
	}

	orders := r.db.GetOrders("", "none")

	return orders, nil
}

// OrderCreator resolves our user query through a db call to CreateOrder
func (r *Resolver) OrderCreator(p graphql.ResolveParams) (interface{}, error) {
	// Strip the name from arguments and assert that it's a string
	orderDate, _ := p.Args["orderDate"].(string)
	details, _ := p.Args["details"].(string)
	idRestaurant, _ := p.Args["idRestaurant"].(int)

	order := r.db.CreateOrder(orderDate, details, idRestaurant)

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
	idRestaurants, _ := p.Args["idRestaurants"].(int)

	rowsAffected := r.db.UpdateOrder(idOrder, idRestaurants)

	return rowsAffected, nil
}
