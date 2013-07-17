'use strict'

angular.module('chalkApp', ['ui.utils', 'ui.state', 'restangular'])
  .config ($urlRouterProvider, $stateProvider, RestangularProvider) ->
    RestangularProvider.setBaseUrl('/api/v1')

    $urlRouterProvider.otherwise('/')

    main = {
      name: 'main'
      url: '/'
      templateUrl: '/views/main.html'
    }
    study = {
      name: 'study'
      abstract: true
      url: ''
      templateUrl: '/views/study.html'
    }
    topics = {
      name: 'study.topics'
      parent: study,
      url: '/topics'
      templateUrl: '/views/topics/index.html'
      controller: 'TopicsIndexCtrl'
    }
    practices = {
      name: 'study.practices'
      parent: study,
      url: '/practices'
      templateUrl: '/views/practices/index.html'
      controller: 'PracticesIndexCtrl'
    }
    quizzes = {
      name: "study.quizzes"
      parent: study
      url: '/quizzes'
      templateUrl: '/views/quizzes/index.html'
      controller: 'QuizzesIndexCtrl'
    }
    quizzes_show = {
      name: "show"
      url: '/quizzes/:id'
      templateUrl: '/views/quizzes/show.html'
      controller: 'QuizzesShowCtrl'
    }
    _.map [main, study, topics, practices, quizzes, quizzes_show], (state) -> $stateProvider.state(state)
