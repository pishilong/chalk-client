angular.module('ngChalk.ky.en.base', [
  'ui.state'
])

.config( ($stateProvider) ->
  $stateProvider.state('ky.en', {
    url: '/en'
    abstract: true
  })
)
