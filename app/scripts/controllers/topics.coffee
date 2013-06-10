'use strict'

app = angular.module('chalkApp')

app.controller 'TopicsIndexCtrl', ($scope) ->
  console.log $scope.$uiRoute

app.controller 'TopicsShowCtrl', ($scope) ->
