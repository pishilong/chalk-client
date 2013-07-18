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

      $scope.$on 'blockSubmitted', (event, count) ->
        $scope.section.record.completed_count += count
        $scope.section.record.status = 'completed' if ($scope.section.record.completed_count == $scope.section.record.total_count)

      $scope.submitSection = (section) ->
        console.log 'submit section', section.id
        $scope.$broadcast 'sectionSubmitted', 'all'
        $scope.$emit 'sectionSubmitted', ($scope.section.record.total_count - $scope.section.record.completed_count)
        $scope.section.record.completed_count = $scope.section.record.total_count
        $scope.section.record.status = 'completed'

      # $scope.$on 'sectionSubmitted', (event, count) ->
        # if count is 'all'
          # $scope.section.record.completed_count = $scope.section.record.total_count
          # $scope.section.record.status = 'completed'
        # else
          # $scope.section.record.completed_count += count
          # $scope.section.record.status = 'completed' if ($scope.section.record.completed_count == $scope.section.record.total_count)

    link: (scope, element, attrs) ->
  }

angular.module('chalkApp').directive 'block', ->
  {
    restrict: 'A'
    scope: {question: '=block', template: '=', questionNum: '='}
    template: '<div class="block" title="block" ng-include="template"></div>'
    controller: ($scope) ->

      $scope.$on 'questionSubmitted', ->
        $scope.question.record.completed_count += 1
        $scope.question.record.status = 'completed' if ($scope.question.record.completed_count == $scope.question.record.total_count)
        $scope.$emit 'blockSubmitted', 1

      $scope.submitBlock = (question) ->
        console.log 'submit block', question.id
        $scope.$broadcast 'blockSubmitted', 'all'
        $scope.$emit 'blockSubmitted', ($scope.question.record.total_count - $scope.question.record.completed_count)
        $scope.question.record.completed_count = $scope.question.record.total_count
        $scope.question.record.status = 'completed'

      # $scope.$on 'blockSubmitted', (event, count) ->
        # if count is 'all'
          # $scope.question.record.completed_count = $scope.question.record.total_count
          # $scope.question.record.status = 'completed'
        # else
          # $scope.question.record.completed_count += count
          # $scope.question.record.status = 'completed' if ($scope.question.record.completed_count == $scope.question.record.total_count)

      $scope.$on 'sectionSubmitted', ->
        $scope.$broadcast 'blockSubmitted'
        $scope.question.record.completed_count = $scope.question.record.total_count
        $scope.question.record.status = 'completed'

    link: (scope, element, attrs) ->
  }

angular.module('chalkApp').directive 'question', ->
  {
    restrict: 'A'
    scope: {question: '=', template: '='}
    template: '<div class="question" title="question" ng-include="template"></div>'
    controller: ($scope, $rootScope) ->
      $scope.submitQuestion = (question, answer) ->
        console.log 'submit questin', question.id, answer
        $scope.record.submitted = true
        $scope.$emit 'questionSubmitted'

      $scope.$on 'blockSubmitted', ->
        $scope.record.submitted = true

    link: (scope, element, attrs) ->
      if scope.question
        scope.question_content = scope.question.question_content
        scope.record = scope.question.record
  }
