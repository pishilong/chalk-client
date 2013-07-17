angular.module('chalkApp').directive 'fillingContent', ($compile) ->
  {
    restrict: 'A'
    link: (scope, element, attrs) ->
      html = scope.$eval(attrs.fillingContent).replace /___/,
        '<input class="_answer" type="text" ng-model="record.answer" ng-disabled="container.submitted" />'
      element.html(html)
      $compile(element.contents())(scope)
  }

angular.module('chalkApp').directive 'questionA', ->
  getTemplateUrl = (question) ->
    switch question.type
      when 'choice' then 'choiceQuestion.html'
      when 'filling' then 'fillingQuestion.html'

  {
    restrict: 'A'
    scope: {question: '=', container: '='}
    templateUrl: 'question.html'
    controller: ($scope) ->
      $scope.isCorrect = -> $scope.record.answer is $scope.question.answer
    link: (scope, element, attrs) ->
      scope.record = {}
      scope.templateUrl = getTemplateUrl(scope.question)
      scope.$watch 'record.answer', _.debounce(((answer) ->
        if answer?
          scope.$emit('answerChanged', scope.question, answer)
      ), 1000)
  }

angular.module('chalkApp').directive 'section', ->
  {
    restrict: 'A'
    scope: {section: '='}
    template: '<div ng-include="\'section.html\'"></div>'
    link: (scope, element, attrs) ->
  }

angular.module('chalkApp').directive 'questionGroup', ->
  {
    restrict: 'A'
    scope: {section: '=questionGroup', template: '='}
    template: '<div ng-include="template"></div>'
    link: (scope, element, attrs) ->
  }

angular.module('chalkApp').directive 'block', ->
  {
    restrict: 'A'
    scope: {question: '=block', template: '='}
    template: '<div ng-include="template"></div>'
    link: (scope, element, attrs) ->
      console.log scope.template
  }

angular.module('chalkApp').directive 'question', ->
  {
    restrict: 'A'
    scope: {question: '=', template: '='}
    template: '<div ng-include="template"></div>'
    link: (scope, element, attrs) ->
  }
