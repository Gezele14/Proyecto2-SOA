//Build nodes
CREATE  (costarica:Pais{name:"Costa Rica"}),
        //Provinces
        (cartago:Provincia{name:"Cartago"}),
        (sanjose:Provincia{name:"San Jose"}),
        (heredia:Provincia{name:"Heredia"}),

        //Restaurants
        (rest1:Restaurant{name:"restaTEC Cartago", address:"Pretil", contact:"25507879", disponibility:"Lunes a Viernes", schedule: "7:30am a 7:00pm"}),
        (rest2:Restaurant{name:"restaTEC San Jose", address:"Frente al campus", contact:"25506897", disponibility:"Lunes a Viernes", schedule: "9:30am a 5:00pm"}),
        (rest3:Restaurant{name:"restaTEC Heredia", address:"Al Norte del campus", contact:"25504786", disponibility:"Martes a Viernes", schedule: "7:30am a 5:00pm"}),

        //Services
        (music:Service{name:"Musica"}),
        (bar:Service{name:"Bar"}),
        (express:Service{name:"Express"}),
        (dance:Service{name:"Pista de baile"}),

        //Food
        (casado:Food{name:"Casado", price: 1000}),
        (pinto:Food{name:"Pinto", price: 1500}),
        (sopa:Food{name:"Sopa", price: 1250}),
        (pollo:Food{name:"Pollo", price: 600}),

        //Drinks
        (natural:Drink{name:"Refresco Natural", price: 500}),
        (soda:Drink{name:"Gaseosa", price: 600}),
        (cafe:Drink{name:"Cafe", price: 250}),
        (tea:Drink{name:"tea", price: 300}),
        (beer:Drink{name:"Cerveza", price: 1000})

//relations
CREATE  
        //Provinces to country
        (cartago)-[:pertenece]->(costarica),
        (sanjose)-[:pertenece]->(costarica),
        (heredia)-[:pertenece]->(costarica),

        //Restaurants to Provinces
        (rest1)-[:en]->(cartago),
        (rest2)-[:en]->(sanjose),
        (rest3)-[:en]->(heredia),

        //Cartago relations
        (rest1)-[:sirve]->(natural),
        (rest1)-[:sirve]->(beer),
        (rest1)-[:sirve]->(cafe),
        (rest1)-[:sirve]->(sopa),
        (rest1)-[:sirve]->(casado),
        (rest1)-[:ofrece]->(dance),
        (rest1)-[:ofrece]->(music),

        //San Jose relations
        (rest2)-[:sirve]->(beer),
        (rest2)-[:sirve]->(soda),
        (rest2)-[:sirve]->(cafe),
        (rest2)-[:sirve]->(pinto),
        (rest2)-[:sirve]->(pollo),
        (rest2)-[:ofrece]->(bar),
        (rest2)-[:ofrece]->(express),

        //Heredia relations
        (rest3)-[:sirve]->(beer),
        (rest3)-[:sirve]->(soda),
        (rest3)-[:sirve]->(tea),
        (rest3)-[:sirve]->(casado),
        (rest3)-[:sirve]->(pollo),
        (rest3)-[:sirve]->(sopa),
        (rest3)-[:ofrece]->(bar),
        (rest3)-[:ofrece]->(express),
        (rest3)-[:ofrece]->(music)








        