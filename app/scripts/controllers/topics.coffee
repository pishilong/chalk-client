'use strict'

app = angular.module('chalkApp')

app.controller 'TopicsIndexCtrl', ($scope, Restangular) ->
  watching = true

  _save = _.debounce dpd.practices.put, 300
  $scope.save = (practice) ->
    watching = false
    _save practice, -> watching = true

  reloadPractices = ->
    if watching
      console.log 'reloading'
      dpd.practices.get (practices) ->
        $scope.practices = practices
        $scope.current = angular.copy practices[0] unless $scope.current?
        $scope.$apply()
    else
      console.log 'not watching'

  cleanup = ->
    dpd.practices.off('post')
    dpd.practices.off('put')
    dpd.practices.off('delete')

  dpd.practices.on 'post', reloadPractices
  dpd.practices.on 'put', reloadPractices
  dpd.practices.on 'delete', reloadPractices

  $scope.$on '$destroy', cleanup

  reloadPractices()

app.controller 'TopicsShowCtrl', ($scope) ->
