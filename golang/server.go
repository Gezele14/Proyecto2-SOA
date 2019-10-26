package server

import (
	"encoding/json"
	"net/http"

	"github.com/Gezele14/Proyecto2-SOA/golang/graphql"
	"github.com/go-chi/render"
	"github.com/graphql-go/graphql"
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
