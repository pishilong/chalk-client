angular.module('ngChalk', [
  'ui.state'
  'ui.route'
  'ui.bootstrap'
  'templates-app'
  'templates-common'
  'ngChalk.home'
  'ngChalk.ui'
  'ngChalk.ky'
])

.config( ($stateProvider, $urlRouterProvider, RestangularProvider) ->
  $urlRouterProvider.otherwise('/home')

  RestangularProvider.setBaseUrl('/api/v1')
)

.run( (titleService) ->
  titleService.setSuffix( ' | 云程学习网' )
)

.controller('AppCtrl', ($scope, $location) ->
)
