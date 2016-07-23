var toDoApp = angular.module('toDoApp', []);

toDoApp.controller('homeController', ['$scope', 'toDoFactory', function ($scope, toDoFactory) {
  $scope.toDos = [];
  $scope.newToDo = {};

  $scope.addToDo = function () {
    toDoFactory.addToDo($scope.newToDo).then(function (response) {
      $scope.toDos.push(response.data);
      $scope.newToDo.description = '';
    });
  }

  $scope.completeToDo = function (toDo) {
    toDo.isComplete = true;
    toDoFactory.completeToDo(toDo);
  }

  $scope.activateToDo = function (toDo) {
    toDo.isComplete = false;
    toDoFactory.activateToDo(toDo);
  }

  $scope.deleteToDo = function (toDo) {
    toDoFactory.deleteToDo(toDo).then(function (response) {
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

    toDoFactory.deleteToDos(queryString).then(function (response) {
      $scope.toDos = $scope.toDos.filter(function (todo) {
        if (todo.isComplete === false) {
          return todo;
        }
      });
    });
  }

  $scope.showAll = function () {
    $scope.hideActive = false;
    $scope.hideComplete = false;
  }
}]);

toDoApp.factory('toDoFactory', ['$http', function ($http) {
  var urlBase = '/api/ToDos/';
  var toDoFactory = {};

  toDoFactory.addToDo = function (toDo) {
    return $http.post(urlBase, toDo);
  };

  toDoFactory.completeToDo = function (toDo) {
    return $http.put(urlBase + toDo.id, toDo);
  };

  toDoFactory.activateToDo = function (toDo) {
    return $http.put(urlBase + toDo.id, toDo);
  };

  toDoFactory.deleteToDo = function (toDo) {
    return $http.delete(urlBase + toDo.id);
  };

  toDoFactory.deleteToDos = function (queryString) {
    return $http.delete(urlBase + queryString);
  };

  return toDoFactory;
}]);