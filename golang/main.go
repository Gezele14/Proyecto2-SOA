package main

import (
	"log"
	"net/http"

	"github.com/Sebasrs/SOAP2/Golang/sql"
	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
	"github.com/go-chi/render"
)

func main() {
	// Initialize our api and return a pointer to our router for http.ListenAndServe
	// and a pointer to our db to defer its closing when main() is finished
	router, db := initializeAPI()
	defer db.Close()

	// Listen on port 4000 and if there's an error log it and exit
	log.Fatal(http.ListenAndServe(":4000", router))
}

func initializeAPI() (*chi.Mux, *sql.Db) {
	// Create a new router
	router := chi.NewRouter()

	// Create a new connection to our pg database
	db, err := sql.New("root:Serbas1500@tcp(127.0.0.1:3306)/soa")

	if err != nil {
		log.Fatal(err)
	}

	// Add some middleware to our router
	router.Use(
		render.SetContentType(render.ContentTypeJSON), // set content-type headers as application/json
		middleware.Logger,          // log api request calls
		middleware.DefaultCompress, // compress results, mostly gzipping assets and json
		middleware.StripSlashes,    // match paths with a trailing slash, strip it, and continue routing through the mux
		middleware.Recoverer,       // recover from panics without crashing server
	)

	return router, db
}
