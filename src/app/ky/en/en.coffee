angular.module('ngChalk.ky.en', [
  'ui.state'
  'ngChalk.ky.base'
  'ngChalk.ky.en.topics'
])

.config( ($urlRouterProvider) ->
  $urlRouterProvider
  .when('/ky/en', '/ky/en/topics')
  .when('/ky/en/', '/ky/en/topics')
)
