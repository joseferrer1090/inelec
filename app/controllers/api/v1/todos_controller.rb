module Api
  module V1
    class TodosController < BaseApiController
      before_action :set_todo, only: [:show, :update, :destroy]
=begin
        @api {get} /todos List todos
        @apiName listTodos
        @apiGroup Todos

        @apiSuccess {Int} id id del titulo del grupo de tareas
        @apiSuccess {String} title  Titulo del grupo de tareas
        @apiSuccess {Int} id id del propietario del grupo de tareas
        @apiSuccess {Date} created_at id del propietario del grupo de tareas
        @apiSuccess {Date} updated_at id del propietario del grupo de tareas
        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        [
          {
            "id": 1,
            "title": "Tarea en el trabajo",
            "created_by": "1",
            "created_at": "2017-04-04T19:38:48.215Z",
            "updated_at": "2017-04-04T19:38:48.215Z"
          },
          {
            "id": 2,
            "title": "Tareas en la casa",
            "created_by": "1",
            "created_at": "2017-04-04T19:39:01.603Z",
            "updated_at": "2017-04-04T19:39:01.603Z"
          }
        ]

        @apiErrorExample {json} Error-Response:
        HTTP/1.1 422 Not Found
        {
          "message": "Missing token"
        }

        @apiErrorExample {json} Error-Response:
        HTTP/1.1 404 Not Found
        {
          "message":"Invalid token Couldn't find User with 'id'=1"
        }

=end
      # GET /todos
      def index
        @todos = current_user.as_json(:include => [ {:todos => { :include => :items }},:roles])
        json_response(@todos)
      end
=begin
        @api {post} /todos Create todos
        @apiName createTodos
        @apiGroup Todos

        @apiSuccess {Int} id id del titulo del grupo de tareas
        @apiSuccess {String} title  Titulo del grupo de tareas
        @apiSuccess {Int} id id del propietario del grupo de tareas
        @apiSuccess {Date} created_at id del propietario del grupo de tareas
        @apiSuccess {Date} updated_at id del propietario del grupo de tareas
        @apiSuccessExample Success-Response:
        HTTP/1.1 200 OK
        [
          {
            "id": 1,
            "title": "Tarea en el trabajo",
            "created_by": "1",
            "created_at": "2017-04-04T19:38:48.215Z",
            "updated_at": "2017-04-04T19:38:48.215Z"
          },
          {
            "id": 2,
            "title": "Tareas en la casa",
            "created_by": "1",
            "created_at": "2017-04-04T19:39:01.603Z",
            "updated_at": "2017-04-04T19:39:01.603Z"
          }
        ]

        @apiErrorExample {json} Error-Response:
        HTTP/1.1 422 Not Found
        {
          "message": "Missing token"
        }

=end
      # POST /todos
      def create
        @todo = current_user.todos.create!(todo_params)
        json_response(@todo, :created)
      end

      # GET /todos/:id
      def show
        json_response(@todo)
      end

      # PUT /todos/:id
      def update
        @todo.update(todo_params)
        head :no_content
      end

      # DELETE /todos/:id
      def destroy
        @todo.destroy
        head :no_content
      end

      private

      def todo_params
        # whitelist params
        params.permit(:title)
      end

      def set_todo
        @todo = Todo.find(params[:id])
      end
    end
  end
end
