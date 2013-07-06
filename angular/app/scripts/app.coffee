'use strict'

angular.module('chalkApp', ['ui.utils', 'ui.state', 'restangular'])
  .config ($stateProvider, RestangularProvider) ->
    RestangularProvider.setBaseUrl('/api/v1')

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
    _.map [main, study, topics, practices], (state) -> $stateProvider.state(state)
