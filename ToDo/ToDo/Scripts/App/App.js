var toDoApp = angular.module('toDoApp', []);

toDoApp.controller('homeController', ['$scope', function ($scope) {
  $scope.toDos = [];
}]);