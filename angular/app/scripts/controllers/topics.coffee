'use strict'

app = angular.module('chalkApp')

app.controller 'TopicsIndexCtrl', ($scope, Restangular) ->
  Restangular.all('users').getList().then (users) ->
    $scope.users = users

app.controller 'TopicsShowCtrl', ($scope) ->
