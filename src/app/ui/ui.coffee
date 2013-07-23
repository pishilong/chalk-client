angular.module('ngChalk.ui', [
  'ui.state'
  'titleService'
])

.config( ($stateProvider) ->
  $stateProvider.state('ui', {
    url: '/ui'
    views: {
      "main": {
        templateUrl: 'ui/ui.tpl.html'
      }
    }
  })
)
