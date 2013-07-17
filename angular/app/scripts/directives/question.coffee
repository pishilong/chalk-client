angular.module('chalkApp').directive 'fillingContent', ($compile) ->
  {
    restrict: 'A'
    link: (scope, element, attrs) ->
      html = scope.$eval(attrs.fillingContent).replace /___/,
        '<input class="_answer" type="text" ng-model="record.answer" ng-disabled="container.submitted" />'
      element.html(html)
      $compile(element.contents())(scope)
  }

angular.module('chalkApp').directive 'question', ->
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
