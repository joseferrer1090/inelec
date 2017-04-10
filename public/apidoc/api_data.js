define({ "api": [
  {
    "type": "post",
    "url": "/admin/clients",
    "title": "Create client",
    "name": "CreateClients",
    "group": "Admin_clients",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "name",
            "description": "<p>Nombre del usuario.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "password",
            "description": "<p>Contraseña del usuario.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "email",
            "description": "<p>email del usuario.</p>"
          }
        ]
      }
    },
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n  \"id\": 8,\n  \"name\": \"Juan Ruiz\",\n  \"last_name\": null,\n  \"email\": \"juanmaca@hotmail.com\",\n  \"password_digest\": \"$2a$10$8tQ1Ui7WbjVWmK1mgD2sBuVccKtJ0GeaMeJNlGpPH2z/sJNpD40O2\",\n  \"created_at\": \"2017-04-10T16:17:17.855Z\",\n  \"updated_at\": \"2017-04-10T16:17:17.855Z\"\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "HTTP/1.1 422 Not Found\n{\n    \"error\": \"UserNotFound\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/api/v1/admin/clients_controller.rb",
    "groupTitle": "Admin_clients"
  },
  {
    "type": "get",
    "url": "/admin/clients",
    "title": "Get clients",
    "name": "getClients",
    "group": "Admin_clients",
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n[\n  {\n    \"id\": 3,\n    \"name\": \"Erika\",\n    \"last_name\": \"De la Vega\",\n    \"email\": \"erikavega@gmail.com\",\n    \"password_digest\": \"$2a$10$33FTSsaVtMMZeIUahosZIO2N12yd.IeUc2EhZiaokE5wcKjlpfRIy\",\n    \"created_at\": \"2017-04-06T18:42:10.839Z\",\n    \"updated_at\": \"2017-04-06T18:42:10.839Z\"\n  },\n  {\n    \"id\": 4,\n    \"name\": \"Viviannys Diaz\",\n    \"last_name\": null,\n    \"email\": \"2arqwer1234z@gsafmailqwer.com\",\n    \"password_digest\": \"$2a$10$nSsv9QiYaLfKth71.N38Pef/ggjwlRNy989w9iw7IR504ecfAiYIG\",\n    \"created_at\": \"2017-04-10T15:22:57.622Z\",\n    \"updated_at\": \"2017-04-10T15:22:57.622Z\"\n  }\n]",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "HTTP/1.1 422 Not Found\n{\n    \"error\": \"UserNotFound\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/api/v1/admin/clients_controller.rb",
    "groupTitle": "Admin_clients"
  },
  {
    "type": "get",
    "url": "/auth/user",
    "title": "Usuario logueado",
    "name": "GetUser",
    "group": "Auth",
    "success": {
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n  \"user\": {\n    \"id\": 6,\n    \"name\": \"Viviannys Diaz\",\n    \"last_name\": null,\n    \"email\": \"2arqweasdfadsfr1234z@sadfgsafmailqwer.com\",\n    \"password_digest\": \"$2a$10$gFKpJSYE6/HWvnEXHAA0X.EOOzlH2SFHQvsNVbYpw7ZhKKgvq4bei\",\n    \"created_at\": \"2017-04-10T15:34:26.710Z\",\n    \"updated_at\": \"2017-04-10T15:34:26.710Z\",\n    \"todos\": [],\n    \"roles\": [\n      {\n        \"id\": 3,\n        \"name\": \"Cliente de inelec\",\n        \"slug\": \"client\",\n        \"description\": \"Usuario capaz de pedir presupuestos\",\n        \"created_at\": \"2017-04-06T18:42:11.259Z\",\n        \"updated_at\": \"2017-04-06T18:42:11.259Z\"\n      }\n    ]\n  },\n  \"exp\": 1527.484673432\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "HTTP/1.1 422 Not Found\n{\n    \"error\": \"UserNotFound\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/api/v1/auth/authentication_controller.rb",
    "groupTitle": "Auth"
  },
  {
    "type": "post",
    "url": "/auth/login",
    "title": "Login User",
    "name": "loginUser",
    "group": "Auth",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "password",
            "description": "<p>Contraseña del usuario.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "email",
            "description": "<p>email del usuario.</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "auth_token",
            "description": "<p>Token de usuario para hacer todas las demas peticiones</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n  \"message\": \"Login successfully\",\n  \"auth\": {\n    \"token\": \"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozLCJleHAiOjE0OTE4NDA4NDV9.iQNyEKLUDKkdHrhkttkGfnOMtX1WM1BxpxfX1G5uzGQ\",\n    \"exp\": 1799,\n    \"user\": {\n      \"id\": 3,\n      \"name\": \"Erika\",\n      \"last_name\": \"De la Vega\",\n      \"email\": \"erikavega@gmail.com\",\n      \"password_digest\": \"$2a$10$33FTSsaVtMMZeIUahosZIO2N12yd.IeUc2EhZiaokE5wcKjlpfRIy\",\n      \"created_at\": \"2017-04-06T18:42:10.839Z\",\n      \"updated_at\": \"2017-04-06T18:42:10.839Z\",\n      \"todos\": [],\n      \"roles\": [\n        {\n          \"id\": 3,\n          \"name\": \"Cliente de inelec\",\n          \"slug\": \"client\",\n          \"description\": \"Usuario capaz de pedir presupuestos\",\n          \"created_at\": \"2017-04-06T18:42:11.259Z\",\n          \"updated_at\": \"2017-04-06T18:42:11.259Z\"\n        }\n      ]\n    },\n    \"type\": \"Bearer\"\n  }\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "HTTP/1.1 422 Not Found\n{\n    \"error\": \"UserNotFound\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/api/v1/auth/authentication_controller.rb",
    "groupTitle": "Auth"
  },
  {
    "type": "post",
    "url": "/auth/signup",
    "title": "Signup User",
    "name": "signupUser",
    "group": "Auth",
    "parameter": {
      "fields": {
        "Parameter": [
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "name",
            "description": "<p>Nombre del usuario.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "password",
            "description": "<p>Contraseña del usuario.</p>"
          },
          {
            "group": "Parameter",
            "type": "String",
            "optional": false,
            "field": "email",
            "description": "<p>email del usuario.</p>"
          }
        ]
      }
    },
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "message",
            "description": "<p>Mensaje de registro.</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "auth_token",
            "description": "<p>Token de usuario para hacer todas las demas peticiones</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n{\n  \"message\": \"Account created successfully\",\n  \"auth\": {\n    \"token\": \"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo2LCJleHAiOjE0OTE4NDAyNjd9.RIBUjcNndbZBQiys2JvJESQJLiBQ_NY4lk7veQBpuX0\",\n    \"type\": \"Bearer\"\n    \"exp\": 1799,\n    \"user\": {\n      \"id\": 6,\n      \"name\": \"Viviannys Diaz\",\n      \"last_name\": null,\n      \"email\": \"2arqweasdfadsfr1234z@sadfgsafmailqwer.com\",\n      \"password_digest\": \"$2a$10$gFKpJSYE6/HWvnEXHAA0X.EOOzlH2SFHQvsNVbYpw7ZhKKgvq4bei\",\n      \"created_at\": \"2017-04-10T15:34:26.710Z\",\n      \"updated_at\": \"2017-04-10T15:34:26.710Z\",\n      \"todos\": [],\n      \"roles\": [\n        {\n          \"id\": 3,\n          \"name\": \"Cliente de inelec\",\n          \"slug\": \"client\",\n          \"description\": \"Usuario capaz de pedir presupuestos\",\n          \"created_at\": \"2017-04-06T18:42:11.259Z\",\n          \"updated_at\": \"2017-04-06T18:42:11.259Z\"\n        }\n      ]\n    }\n  }\n}",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "HTTP/1.1 422 Not Found\n{\n    \"error\": \"UserNotFound\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/api/v1/auth/authentication_controller.rb",
    "groupTitle": "Auth"
  }
] });
