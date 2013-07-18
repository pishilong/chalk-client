angular.module('chalkApp').factory 'SectionChange', ->
  {
    flag: true
    value: null
    trigger: (section)->
      this.flag = !this.flag
      this.value = section
  }
