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

angular.module('chalkApp').directive 'ycQuestionContainer', ->
  {
    restrict: 'A'
    scope: {questionContainer: '=ycQuestionContainer', defaultSection: '=', template: '='}
    template: '<div class="yc-question-container" title="question-container" ng-include="template"></div>'
    link: (scope, element, attrs) ->
  }

angular.module('chalkApp').directive 'sectionSider', ->
  {
    restrict: 'A'
    scope: {section: '=sectionSider'}
    template: '<div class="section-sider" title="section-sider-{{section.id}}" ng-include="\'section_sider.html\'"></div>'
    controller: ($scope, SectionChange) ->
      $scope.showSection = (section) ->
        SectionChange.trigger(section)
    link: (scope, element, attrs) ->
  }

angular.module('chalkApp').directive 'section', ->
  {
    restrict: 'A'
    scope: {section: '=', template: '='}
    template: '<div class="section" title="section" ng-include="template"></div>'
    controller: ($scope, SectionChange) ->
      $scope.SectionChange = SectionChange
      $scope.$watch('SectionChange.flag', ->
        if SectionChange.value
          $scope.section = SectionChange.value
      )
    link: (scope, element, attrs) ->
  }

angular.module('chalkApp').directive 'block', ->
  {
    restrict: 'A'
    scope: {question: '=block', template: '=', questionNum: '='}
    template: '<div class="block" title="block" ng-include="template"></div>'
    link: (scope, element, attrs) ->
  }

angular.module('chalkApp').directive 'question', ->
  {
    restrict: 'A'
    scope: {question: '=', template: '='}
    template: '<div class="question" title="question" ng-include="template"></div>'
    link: (scope, element, attrs) ->
  }
