'use strict'

app = angular.module('chalkApp')

app.controller 'TopicsIndexCtrl', ($scope, Restangular, $timeout) ->
  #Restangular.all('users').getList().then (users) ->
  #  $scope.users = users

  $scope.questions = [
    {
      type: 'choice',
      content: 'Choose one from the following?'
      num: 1
      option_a: 'Option A'
      option_b: 'Option B'
      option_c: 'Option C'
      option_d: 'Option D'
      answer: 'C'
    }, {
      type: 'choice',
      content: 'Choose another one?'
      num: 2
      option_a: 'strong'
      option_b: 'fast'
      option_c: 'high'
      option_d: 'powerful'
      answer: 'A'
    }, {
      type: 'filling',
      content: 'Fill ___ here.'
      num: 3
      answer: 'example answer'
    },
  ]

  $scope.container = {submitted: false}
 
  $scope.toggleSubmit = -> $scope.container.submitted = !$scope.container.submitted

  $scope.$on 'answerChanged', (event, question, answer) ->
    console.log 'answer changed -', question.num, answer

app.controller 'TopicsShowCtrl', ($scope) ->
