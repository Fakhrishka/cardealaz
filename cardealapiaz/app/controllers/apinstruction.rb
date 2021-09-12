URL localhost:3000/api/v1/cars 

Response
"BRAND": [
    {
        "id": 3,
        "brand_id": 2,
        "model": "X5",
        "test_drive": 0,
        "created_at": "2021-09-05T15:42:39.750Z",
        "updated_at": "2021-09-09T01:17:02.656Z",
        "startprice": 89000
    }
]

____________________________________________________________

URL localhost:3000/api/v1/cars/#carid
Info : Receiver collects all information regarding different
versions of the vehicle

{
    "id": 1,
    "car_id": 1,
    "price": 38900,
    "name": "Luxury",
    "engine": 1500,
    "created_at": "2021-09-08T23:54:49.811Z",
    "updated_at": "2021-09-08T23:54:49.811Z"
},
{
    "id": 2,
    "car_id": 1,
    "price": 45900,
    "name": "Prestige",
    "engine": 1500,
    "created_at": "2021-09-08T23:56:29.856Z",
    "updated_at": "2021-09-08T23:56:29.856Z"
    }

____________________________________________________________


URL : localhost:3000/api/v1/cars/1/mycars
Descr : Receives the information about all cars related to brand that
is/are controller by user
Request
{
    "login"=>"fakhrishka",
    "token"=>"[FILTERED]",
    "id"=>"1"
}

Response
{
    "id"=>1,
    "brand_id"=>1,
    "model"=>"Bestune T-77",
    "test_drive"=>1,
    "created_at"=>"2021-09-05T15:41:55.170Z",
    "updated_at"=>"2021-09-05T15:41:55.170Z"
}