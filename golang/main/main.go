package main

import (
	"encoding/json"
	"log"
	"net/http"
	"sql"

	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
	"github.com/go-chi/render"

	"github.com/Gezele14/Proyecto2-SOA/golang/graphql"
)

type Server struct {
	GqlSchema *graphql.Schema
}

type reqBody struct {
	Query string `json:"query"`
}

func (s *Server) GraphQL() http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {

		if r.Body == nil {
			http.Error(w, "Must provide graphql query in request body", 400)
			return
		}

		var rBody reqBody

		err := json.NewDecoder(r.Body).Decode(&rBody)

		if err != nil {
			http.Error(w, "Error parsing JSON request body", 400)
		}

		result := graphql.ExecuteQuery(rBody.Query, *s.GqlSchema)

		render.JSON(w, r, result)
	}
}

func initializeAPI() (*chi.Mux, *sql.Db) {

	router := chi.NewRouter()
	db, err := sql.New("root:123456@tcp(192.168.219.93:3306)/restDB")
	if err != nil {
		log.Fatal(err)
	}

	router.Use(
		render.SetContentType(render.ContentTypeJSON),
		middleware.Logger,
		middleware.DefaultCompress,
		middleware.StripSlashes,
		middleware.Recoverer,
	)

	return router, db
}

func main() {
	router, db := initializeAPI()
	defer db.Close()
	log.Fatal(http.ListenAndServe(":8100", router))
}
