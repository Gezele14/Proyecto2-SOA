package graphqlquery

import "github.com/graphql-go/graphql"

// Client describes a graphql object containing a User
var Client = graphql.NewObject(
	graphql.ObjectConfig{
		Name: "client",
		Fields: graphql.Fields{
			"idclient": &graphql.Field{
				Type: graphql.Int,
			},
			"identification": &graphql.Field{
				Type: graphql.String,
			},
			"fName": &graphql.Field{
				Type: graphql.String,
			},
			"lName": &graphql.Field{
				Type: graphql.String,
			},
			"address": &graphql.Field{
				Type: graphql.String,
			},
			"email": &graphql.Field{
				Type: graphql.String,
			},
			"phone": &graphql.Field{
				Type: graphql.String,
			},
			"IDprovince": &graphql.Field{
				Type: graphql.String,
			},
		},
	},
)

var User = graphql.NewObject(
	graphql.ObjectConfig{
		Name: "user",
		Fields: graphql.Fields{
			"idclient": &graphql.Field{
				Type: graphql.Int,
			},
			"Name": &graphql.Field{
				Type: graphql.String,
			},
			"Password": &graphql.Field{
				Type: graphql.String,
			},
			"IDClient": &graphql.Field{
				Type: Client,
			},
		},
	},
)

// Restaurant describes a graphql object containing a Restaurant
var Restaurant = graphql.NewObject(
	graphql.ObjectConfig{
		Name: "restaurant",
		Fields: graphql.Fields{
			"IDRestaurant": &graphql.Field{
				Type: graphql.Int,
			},
			"Name": &graphql.Field{
				Type: graphql.String,
			},
			"Address": &graphql.Field{
				Type: graphql.String,
			},
			"DisponibilityDays": &graphql.Field{
				Type: graphql.String,
			},
			"IDprovinces": &graphql.Field{
				Type: graphql.String,
			},
			"ContactNumber": &graphql.Field{
				Type: graphql.String,
			},
		},
	},
)

// Order describes a graphql object containing a Order
var Order = graphql.NewObject(
	graphql.ObjectConfig{
		Name: "order",
		Fields: graphql.Fields{
			"Restaurant": &graphql.Field{
				Type: Restaurant,
			},
			"OrderDate": &graphql.Field{
				Type: graphql.DateTime,
			},
			"Details": &graphql.Field{
				Type: graphql.String,
			},
			"User": &graphql.Field{
				Type: User,
			},
			"Client": &graphql.Field{
				Type: Client,
			},
		},
	},
)
