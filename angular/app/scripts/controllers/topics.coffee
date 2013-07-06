'use strict'

app = angular.module('chalkApp')

app.controller 'TopicsIndexCtrl', ($scope, Restangular) ->
  Restangular.all('users').getList().then (users) ->
    console.log users.length
    console.log _.pluck(users, 'id')
    console.log _.pluck(users, 'name')

app.controller 'TopicsShowCtrl', ($scope) ->
