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

  $scope.deleteToDo = function (toDo) {
    $http.delete('/api/ToDos/' + toDo.id).then(function (response) {
      var index = $scope.toDos.indexOf(toDo);
      $scope.toDos.splice(index, 1);
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
}]);