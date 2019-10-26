package main

import (
	"encoding/json"
<<<<<<< HEAD
=======
	"fmt"
>>>>>>> 8bac3af8960498e2c2528431c590610b38504030
	"log"
	"net/http"

	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
	"github.com/go-chi/render"
<<<<<<< HEAD

	"github.com/Gezele14/Proyecto2-SOA/golang/graphql"
=======
	"github.com/graphql-go/graphql"

	"github.com/Gezele14/Proyecto2-SOA/golang/database"
	"github.com/Gezele14/Proyecto2-SOA/golang/graphqlquery"
>>>>>>> 8bac3af8960498e2c2528431c590610b38504030
)

type Server struct {
	GqlSchema *graphql.Schema
}

type reqBody struct {
	Query string `json:"query"`
}

<<<<<<< HEAD
func (s *Server) GraphQL() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {

=======
// GraphQL returns an http.HandlerFunc for our /graphql endpoint
func (s *Server) GraphQL() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		// Check to ensure query was provided in the request body
>>>>>>> 8bac3af8960498e2c2528431c590610b38504030
		if r.Body == nil {
			http.Error(w, "Must provide graphql query in request body", 400)
			return
		}

		var rBody reqBody
<<<<<<< HEAD

		err := json.NewDecoder(r.Body).Decode(&rBody)

		if err != nil {
			http.Error(w, "Error parsing JSON request body", 400)
		}

		result := graphql.ExecuteQuery(rBody.Query, *s.GqlSchema)

=======
		// Decode the request body into rBody
		err := json.NewDecoder(r.Body).Decode(&rBody)
		if err != nil {
			http.Error(w, "Error parsing JSON request body", 400)
		}
		// Execute graphql query
		result := graphqlquery.ExecuteQuery(rBody.Query, *s.GqlSchema)

		// render.JSON comes from the chi/render package and handles
		// marshalling to json, automatically escaping HTML and setting
		// the Content-Type as application/json.
>>>>>>> 8bac3af8960498e2c2528431c590610b38504030
		render.JSON(w, r, result)
	}
}

<<<<<<< HEAD
func initializeAPI() (*chi.Mux, *sql.Db) {

	router := chi.NewRouter()
	db, err := sql.New("root:123456@tcp(192.168.219.93:3306)/restDB")
=======
// GraphQL returns an http.HandlerFunc for our /graphql endpoint
func (s *Server) ServiceWelcome() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "orders-service")
	}
}

func initializeAPI() (*chi.Mux, *database.Db) {
	// Create a new router
	router := chi.NewRouter()

	// Create a new connection to our pg database
	db, err := database.New("root:123456@tcp(192.168.219.93:3306)/restDB")

>>>>>>> 8bac3af8960498e2c2528431c590610b38504030
	if err != nil {
		log.Fatal(err)
	}

<<<<<<< HEAD
	router.Use(
		render.SetContentType(render.ContentTypeJSON),
		middleware.Logger,
		middleware.DefaultCompress,
		middleware.StripSlashes,
		middleware.Recoverer,
	)

=======
	// Create our root query for graphql
	rootQuery := graphqlquery.NewRoot(db)
	// Create a new graphql schema, passing in the the root query
	sc, err := graphql.NewSchema(
		graphql.SchemaConfig{Query: rootQuery.Query, Mutation: rootQuery.Mutation},
	)
	if err != nil {
		fmt.Println("Error creating schema: ", err)
	}

	// Create a server struct that holds a pointer to our database as well
	// as the address of our graphql schema
	s := Server{
		GqlSchema: &sc,
	}

	// Add some middleware to our router
	router.Use(
		render.SetContentType(render.ContentTypeJSON), // set content-type headers as application/json
		middleware.Logger,          // log api request calls
		middleware.DefaultCompress, // compress results, mostly gzipping assets and json
		middleware.StripSlashes,    // match paths with a trailing slash, strip it, and continue routing through the mux
		middleware.Recoverer,       // recover from panics without crashing server
	)

	// Create the graphql route with a Server method to handle it
	router.Get("/orders", s.ServiceWelcome())
	router.Post("/orders/graphql", s.GraphQL())
>>>>>>> 8bac3af8960498e2c2528431c590610b38504030
	return router, db
}

func main() {
	router, db := initializeAPI()
	defer db.Close()
	log.Fatal(http.ListenAndServe(":8100", router))
}
