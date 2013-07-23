angular.module('ngChalk.ui', [
  'ui.state'
  'titleService'
])

.config( ($stateProvider) ->
  $stateProvider.state('ui', {
    url: '/ui'
    views: {
      "main": {
        controller: 'UiCtrl'
        templateUrl: 'ui/ui.tpl.html'
      }
    }
  })
)
