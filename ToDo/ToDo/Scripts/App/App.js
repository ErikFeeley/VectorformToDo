var toDoApp = angular.module('toDoApp', []);

toDoApp.controller('homeController', ['$scope', '$http', function ($scope, $http) {
  $scope.toDos = [];
  $scope.newToDo = {};

  $scope.addToDo = function (description) {
    $http.post('/api/ToDos', $scope.newToDo).then(function (response) {
      $scope.toDos.push(response.data);
      $scope.newToDo.description = '';
    });
  }

  $scope.completeToDo = function (toDo) {
    toDo.isComplete = true;
    $http.put('/api/ToDos/' + toDo.id, toDo).then(function (response) {
    });
  }

  $scope.activateToDo = function (toDo) {
    toDo.isComplete = false;
    $http.put('/api/ToDos/' + toDo.id, toDo).then(function (response) {
    });
  }

  $scope.deleteToDo = function (toDo) {
    $http.delete('/api/ToDos/' + toDo.id).then(function (response) {
      var index = $scope.toDos.indexOf(toDo);
      $scope.toDos.splice(index, 1);
    });
  }

  $scope.deleteToDos = function () {
    var toDosToDelete = $scope.toDos.filter(function (todo) {
      if (todo.isComplete === true) {
        return todo;
      }
    });

    var ids = toDosToDelete.map(function (todo) {
      return todo['id'];
    });

    var queryString = '?';
    ids.forEach(function (id) {
      queryString += 'ids=' + id + '&';
    });
    queryString = queryString.slice(0, -1);

    $http.delete('/api/ToDos/' + queryString).then(function (response) {
      $scope.toDos = $scope.toDos.filter(function (todo) {
        if (todo.isComplete === false) {
          return todo;
        }
      });
    });
  }
}]);