angular.module('ngChalk', [
  'templates-app'
  'templates-common'
  'ngChalk.home'
  'ngChalk.ui'
  'ngChalk.ky'
  'ui.state'
  'ui.route'
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
