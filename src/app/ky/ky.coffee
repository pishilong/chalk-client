angular.module('ngChalk.ky', [
  'ui.state'
  'ngChalk.ky.en'
])

.config( ($urlRouterProvider) ->
  $urlRouterProvider
  .when('/ky', '/ky/en')
  .when('/ky/', '/ky/en')
)
