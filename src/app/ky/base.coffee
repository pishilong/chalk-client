angular.module('ngChalk.ky.base', [
  'ui.state'
])

.config( ($stateProvider) ->
  $stateProvider.state('ky', {
    url: '/ky'
    abstract: true
  })
)
