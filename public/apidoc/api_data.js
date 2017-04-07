define({ "api": [
  {
    "type": "post",
    "url": "/todos",
    "title": "Create todos",
    "name": "createTodos",
    "group": "Todos",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "id",
            "description": "<p>id del titulo del grupo de tareas</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "title",
            "description": "<p>Titulo del grupo de tareas</p>"
          },
          {
            "group": "Success 200",
            "type": "Date",
            "optional": false,
            "field": "created_at",
            "description": "<p>id del propietario del grupo de tareas</p>"
          },
          {
            "group": "Success 200",
            "type": "Date",
            "optional": false,
            "field": "updated_at",
            "description": "<p>id del propietario del grupo de tareas</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n[\n  {\n    \"id\": 1,\n    \"title\": \"Tarea en el trabajo\",\n    \"created_by\": \"1\",\n    \"created_at\": \"2017-04-04T19:38:48.215Z\",\n    \"updated_at\": \"2017-04-04T19:38:48.215Z\"\n  },\n  {\n    \"id\": 2,\n    \"title\": \"Tareas en la casa\",\n    \"created_by\": \"1\",\n    \"created_at\": \"2017-04-04T19:39:01.603Z\",\n    \"updated_at\": \"2017-04-04T19:39:01.603Z\"\n  }\n]",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "HTTP/1.1 422 Not Found\n{\n  \"message\": \"Missing token\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/api/v1/todos_controller.rb",
    "groupTitle": "Todos"
  },
  {
    "type": "get",
    "url": "/todos",
    "title": "List todos",
    "name": "listTodos",
    "group": "Todos",
    "success": {
      "fields": {
        "Success 200": [
          {
            "group": "Success 200",
            "type": "Int",
            "optional": false,
            "field": "id",
            "description": "<p>id del titulo del grupo de tareas</p>"
          },
          {
            "group": "Success 200",
            "type": "String",
            "optional": false,
            "field": "title",
            "description": "<p>Titulo del grupo de tareas</p>"
          },
          {
            "group": "Success 200",
            "type": "Date",
            "optional": false,
            "field": "created_at",
            "description": "<p>id del propietario del grupo de tareas</p>"
          },
          {
            "group": "Success 200",
            "type": "Date",
            "optional": false,
            "field": "updated_at",
            "description": "<p>id del propietario del grupo de tareas</p>"
          }
        ]
      },
      "examples": [
        {
          "title": "Success-Response:",
          "content": "HTTP/1.1 200 OK\n[\n  {\n    \"id\": 1,\n    \"title\": \"Tarea en el trabajo\",\n    \"created_by\": \"1\",\n    \"created_at\": \"2017-04-04T19:38:48.215Z\",\n    \"updated_at\": \"2017-04-04T19:38:48.215Z\"\n  },\n  {\n    \"id\": 2,\n    \"title\": \"Tareas en la casa\",\n    \"created_by\": \"1\",\n    \"created_at\": \"2017-04-04T19:39:01.603Z\",\n    \"updated_at\": \"2017-04-04T19:39:01.603Z\"\n  }\n]",
          "type": "json"
        }
      ]
    },
    "error": {
      "examples": [
        {
          "title": "Error-Response:",
          "content": "HTTP/1.1 422 Not Found\n{\n  \"message\": \"Missing token\"\n}",
          "type": "json"
        },
        {
          "title": "Error-Response:",
          "content": "HTTP/1.1 404 Not Found\n{\n  \"message\":\"Invalid token Couldn't find User with 'id'=1\"\n}",
          "type": "json"
        }
      ]
    },
    "version": "0.0.0",
    "filename": "app/controllers/api/v1/todos_controller.rb",
    "groupTitle": "Todos"
  },
  {
    "type": "post",
    "url": "/auth/login",
    "title": "Login User",
    "name": "loginUser",
    "group": "User",
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
          "content": "HTTP/1.1 200 OK\n{\n    \"auth_token\": \"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE0OTE0MjY4Njh9.3W-lc2ytYjhddmV5xQYuJFQMZXM-4rYwz6cyxnHNr-4\"\n}",
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
    "filename": "app/controllers/api/v1/authentication_controller.rb",
    "groupTitle": "User"
  },
  {
    "type": "post",
    "url": "/auth/signup",
    "title": "Signup User",
    "name": "signupUser",
    "group": "User",
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
          "content": "HTTP/1.1 200 OK\n{\n    \"message\": \"Account created successfully\",\n    \"auth_token\": \"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo1LCJleHAiOjE0OTE0MjY4Njh9.3W-lc2ytYjhddmV5xQYuJFQMZXM-4rYwz6cyxnHNr-4\"\n}",
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
    "filename": "app/controllers/api/v1/users_controller.rb",
    "groupTitle": "User"
  }
] });
