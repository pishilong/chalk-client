'use strict'

angular.module('chalkApp', ['restangular', 'ui.utils'])
  .config (RestangularProvider, $routeProvider) ->
    RestangularProvider.setBaseUrl('/api/v1')

    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'

      .when '/topics',
        templateUrl: 'views/topics/index.html'
        controller: 'TopicsIndexCtrl'
      .when '/topics/:id',
        templateUrl: 'views/topics/show.html'
        controller: 'TopicsShowCtrl'

      .when '/practices',
        templateUrl: 'views/practices/index.html'
        controller: 'PracticesIndexCtrl'
      .when '/practices/:id',
        templateUrl: 'views/practices/show.html'
        controller: 'PracticesShowCtrl'

      .when '/quizzes',
        templateUrl: 'views/quizzes/index.html'
        controller: 'QuizzesIndexCtrl'
      .when '/quizzes/:id',
        templateUrl: 'views/quizzes/show.html'
        controller: 'QuizzesShowCtrl'

      .otherwise
        redirectTo: '/'
