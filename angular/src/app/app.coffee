angular.module('ngChalk', [
  'templates-app',
  'templates-common',
  'ngChalk.home',
  'ngChalk.topics',
  'ui.state',
  'ui.route'
])

.config( ($stateProvider, $urlRouterProvider) ->
  $urlRouterProvider.otherwise( '/home' )
)

.run( (titleService) ->
  titleService.setSuffix( ' | 云程学习网' )
)

.controller('AppCtrl', ($scope, $location) ->
)
