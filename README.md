| | | | | | | | | | | | | | | | | | | | | |
|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|
|info| | | | |item| | | | | | | | | | | | | | | |
|_postman_id|name|schema|_exporter_id|_collection_link|name|request| | | | | | | | | | | | | |response|
| | | | | | |method|header|body| | |url| | | | |auth| | | | |
| | | | | | | | |mode|raw|options|raw|host|path|protocol|port|type|bearer| | | |
| | | | | | | | | | |raw| | | | | | |key|value|type| |
| | | | | | | | | | |language| | | | | | | | | | |
|2a792528-89ee-4745-838c-6f256dee3ff5|library|https://schema.getpostman.com/json/collection/v2.1.0/collection.json|27230161|https://winter-escape-140156.postman.co/workspace/Team-Workspace~98d285f5-dc85-43cf-8dd3-5471d116d168/collection/27230161-2a792528-89ee-4745-838c-6f256dee3ff5?action=share&source=collection_link&creator=27230161|register|POST| |raw|{     "username": "vidoan2003",     "password": "khacvi2003AZ",     "email": "khacvi2003@gmail.com",     "name": "Khắc Vi" }|json|{{URL}}/api/v1/user/register|{{URL}}|api| | | | | | | |
| | | | | |login|POST| |raw|{     "username": "vidoan2003",     "password": "khacvi2003AZ" }|json|{{URL}}/api/v1/user/login|{{URL}}|api| | | | | | | |
| | | | | |changePassword|POST| |raw|{     "password": "khacvi2003AZ",     "newpassword": "khacvi2003@AZ" }|json|{{URL}}/api/v1/user/changePassword|{{URL}}|api| | | | | | | |
| | | | | |changeInfo|POST| |raw|{     "name": "ĐOÀN KHẮC Vi 2003",     "email": "khacvi2003@gmail.com",     "password": "khacvi2003Z" }|json|http://localhost:5000/api/v1/user/changeInfo|localhost|api|http|5000|bearer|token|eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsInVzZXJuYW1lIjoidmlkb2FuMjAwMyIsImlhdCI6MTcxMjgzMDg3OSwiZXhwIjoxNzEyODMyNjc5fQ.BQO5-VEsN2DccEyvkIMTZqvvZP1OEzBBZro3kBrKrmc|string| |
| | | | | |getBookById|GET| | | | |http://localhost:5000/api/v1/book/57|localhost|api|http|5000| | | | | |
| | | | | |getAllBook|GET| | | | |http://localhost:5000/api/v1/book|localhost|api|http|5000| | | | | |
| | | | | |getUserById|GET| | | | | | |v1| | | | | | | |
| | | | | |searchByKeyWord|GET| | | | | | |book| | | | | | | |
| | | | | |getAllCategory|GET| | | | | | | | | | | | | | |
| | | | | |getBookByCategory|GET| | | | | | | | | | | | | | |
| | | | | |GetBookByAuthor|GET| | | | | | | | | | | | | | |
| | | | | |getAuthorById|GET| | | | | | | | | | | | | | |
| | | | | |getAllAuthor|GET| | | | | | | | | | | | | | |
| | | | | |getAuthorBySlug|GET| | | | | | | | | | | | | | |
| | | | | |getCategorySlug|GET| | | | | | | | | | | | | | |
| | | | | |getWishListByToken|GET| | | | |http://localhost:5000/api/v1/wishlist|localhost|api|http|5000| | | | | |
| | | | | |addWishList|POST| | | | |http://localhost:5000/api/v1/wishlist|localhost|api|http|5000|bearer|token|eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsInVzZXJuYW1lIjoidmlkb2FuMjAwMyIsImlhdCI6MTcxMjg4NDI1NiwiZXhwIjoxNzEyODg2MDU2fQ.MQjbDIYtK00RAr33kbryvu06a4jO1RGUHRu6PSyxl_g|string| |
| | | | | |removeWishList|DELETE| |raw|{     "bookId": 58 }|json|http://localhost:5000/api/v1/wishlist|localhost|api|http|5000|bearer|token|eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsInVzZXJuYW1lIjoidmlkb2FuMjAwMyIsImlhdCI6MTcxMzE0NTQzOCwiZXhwIjoxNzEzMTQ3MjM4fQ.NFew3CR9mM-mAE0pmobyZ1DQQRypg9WKTpbq4-6-6bg|string| |
| | | | | | | | | | | | | |v1| | | | | | | |
| | | | | | | | | | | | | |wishlist| | | | | | | |
