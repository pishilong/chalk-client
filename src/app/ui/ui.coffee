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
        controller: 'UiCtrl'
      }
    }
  })
)

.controller('UiCtrl', ($scope, $dialog) ->
  $scope.openDialog = ->
    d = $dialog.dialog
      templateUrl: 'ui/dialog1.tpl'
      controller: ($scope, dialog) ->
        $scope.close = (result) -> dialog.close(result)
    d.open().then (result) ->

  $scope.openDialog2 = ->
    d = $dialog.dialog
      templateUrl: 'ui/dialog2.tpl'
      controller: ($scope, dialog) ->
        $scope.close = -> dialog.close()
    d.open().then (result) ->

  $scope.openMessageBox = ->
    title = 'This is a message box'
    msg = 'This is the content of the message box'
    btns = [
      {result:'确定', label: '确定', cssClass: 'btn-primary'}
      {result:'取消', label: '取消'}
    ]
    $dialog.messageBox(title, msg, btns)
    .open()
    .then (result) ->
      alert('你点了: ' + result)

  $scope.oneAtATime = true

  $scope.groups = [
    {
      title: "Dynamic Group Header - 1"
      content: "Dynamic Group Body - 1"
    }
    {
      title: "Dynamic Group Header - 2"
      content: "Dynamic Group Body - 2"
    }
  ]

  $scope.items = ['Item 1', 'Item 2', 'Item 3']

  $scope.addItem = ->
    newItemNo = $scope.items.length + 1
    $scope.items.push('Item ' + newItemNo)
)
