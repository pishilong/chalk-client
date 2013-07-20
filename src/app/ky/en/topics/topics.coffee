angular.module( 'ngChalk.ky.en.topics', [
  'ui.state'
  'placeholders'
  'ui.bootstrap'
  'titleService'
  'ycQuestion'
  'ngChalk.ky.en.base'
])

.config( ($stateProvider) ->
  $stateProvider.state('ky.en.topics',
    url: '/topics'
    views:
      'main@':
        controller: 'TopicsIndexCtrl'
        templateUrl: 'ky/en/topics/index.tpl.html'
  ).state('ky.en.topics.show',
    url: '/:id'
    views:
      'main@':
        controller: 'TopicsShowCtrl'
        templateUrl: 'ky/en/topics/show.tpl.html'
  )
)

.controller('TopicsIndexCtrl', ($scope, $stateParams, titleService) ->
  console.log 'aaaaaa'
  titleService.setTitle('学专题')

  $scope.category = $stateParams.category
  $scope.subject = $stateParams.subject

  $scope.topics = [
    {title: "专题1", id: 1},
    {title: "专题2", id: 2}
  ]
)

.controller('TopicsShowCtrl', ($scope, titleService) ->
  findInTreeNodes = (nodes, id) ->
    found = null
    _.any nodes, (node) ->
      if node.id is id
        found = node
        found
      else if node.children
        found = findInTreeNodes(node.children, id)
        found
      else
        false
    found

  $scope.findTemplate = (type, section) ->
    $scope.render.templates[type][section.id]

  $scope.findSectionTemplate = (section) ->
    if section.question
      $scope.findTemplate("question", section.question)
    else
      $scope.findTemplate("section", section)

  json_resp = {
    render: {
      default_section_id: 1,
      templates: {
        section: {
          2: 'section_template_1'
          4: 'section_template_1'
          5: 'section_template_1'
          6: 'section_template_1'
          7: 'section_template_1'
        },
        question: {
          4: 'block_template_1',
          5: 'block_template_1'
        }
      }
    },
    question_container: {
      title: "2012考研英语",
      type: "真题",
      description: "这份试卷只是用来测试demo",
      duration: "125分钟",
      question_sections: [
        {
          id: 1,
          title: "Section I Use of English",
          description: "",
          level: 1,
          p_id: null,
          order_idx: 1,
          record: {
            status: 'in_progress'
            completed_count: 1
            total_count: 2
          }
          children: [
            {
              id: 3,
              title: null,
              description: null,
              level: 2,
              p_id: 1,
              order_idx: 1,
              question_num: 1,
              question: {
                id: 1,
                level: 1,
                order_idx: 1,
                title: null,
                matched_title: null,
                description: null,
                material: "~~~",
                options: null,
                record: {
                  status: 'in_progress'
                  completed_count: 1
                  total_count: 2
                }
                children: [
                  {
                    id: 2,
                    level: 2,
                    order_idx: 1,
                    title: null,
                    matched_title: null,
                    description: null,
                    material: null,
                    options: null,
                    record: {
                      submitted: true
                      answer: 'A'
                      correct: false
                    }
                    question_content: {
                      id: 1,
                      question_num: 1,
                      answer_type: "choice",
                      content: null,
                      answer: "B",
                      analysis: "~~~",
                      fallible_point: null,
                      option_a: "emphasize",
                      option_b: "maintain",
                      option_c: "modify",
                      option_d: "recognize"
                    }
                  },
                  {
                    id: 3,
                    level: 2,
                    order_idx: 2,
                    title: null,
                    matched_title: null,
                    description: null,
                    material: null,
                    options: null,
                    record: {
                      submitted: false
                      answer: "C"
                      correct: null
                    }
                    question_content: {
                      id: 2,
                      question_num: 2,
                      answer_type: "choice",
                      content: null,
                      answer: "A",
                      analysis: "~~~",
                      fallible_point: null,
                      option_a: "when",
                      option_b: "lest",
                      option_c: "before",
                      option_d: "unless"
                    }
                  }
                ]
              }
            }
          ]
        },
        {
          id: 2,
          title: "Section II Reading Comprehension",
          description: null,
          level: 1,
          p_id: null,
          order_idx: 2,
          record: {
            status: 'new'
            completed_count: 0
            total_count: 2
          }
          children: [
            {
              id: 4
              title: "Part A",
              description: "~~~",
              level: 2,
              p_id: 2,
              order_idx: 1,
              record: {
                status: 'new'
                completed_count: 0
                total_count: 2
              }
              children: [
                {
                  id: 5,
                  title: null,
                  description: null,
                  level: 3,
                  p_id: 4,
                  order_idx: 1,
                  question_num: "Text 1",
                  question: {
                    id: 4
                    level: 1,
                    order_idx: 1,
                    title: null,
                    matched_title: null,
                    description: null,
                    material: "~~~",
                    options: null,
                    record: {
                      status: 'new'
                      completed_count: 0
                      total_count: 2
                    }
                    children: [
                      {
                        id: 6,
                        level: 2,
                        order_idx: 1,
                        title: null,
                        matched_title: null,
                        description: null,
                        material: null,
                        options: null,
                        record: {
                          submitted: false
                          answer: null
                          correct: null
                        }
                        question_content: {
                          id: 3,
                          question_num: 1,
                          answer_type: "choice",
                          content: "~~~",
                          answer: "D",
                          analysis: "~~~",
                          fallible_point: null,
                          option_a: "a supplement to the social cure",
                          option_b: "a stimulus to group dynamics",
                          option_c: "an obstacle to school progress",
                          option_d: "a cause of undesirable behaviors"
                        }
                      },
                      {
                        id: 7,
                        level: 2,
                        order_idx: 2,
                        title: null,
                        matched_title: null,
                        description: null,
                        material: null,
                        options: null,
                        record: {
                          submitted: false
                          answer: null
                          correct: null
                        }
                        question_content: {
                          id: 4,
                          question_num: 2,
                          answer_type: "choice",
                          content: "~~~",
                          answer: "B",
                          analysis: "~~~",
                          fallible_point: null,
                          option_a: "recruit professional advertisers",
                          option_b: "learn from advertisers’ experience",
                          option_c: "stay away from commercial advertisers",
                          option_d: "recognize the limitations of ads"
                        }
                      }
                    ]
                  }
                },
                {
                  id: 6,
                  title: null,
                  description: null,
                  level: 3,
                  p_id: 4,
                  order_idx: 2,
                  question_num: "Text 2",
                  question: {
                    id: 5,
                    level: 1,
                    order_idx: 2,
                    title: null,
                    matched_title: null,
                    description: null,
                    material: "~~~",
                    options: null
                    record: {
                      status: 'new'
                      completed_count: 0
                      total_count: 0
                    }
                  }
                }
              ]
            },
            {
              id: 7
              title: "Part B",
              description: "~~~",
              level: 2,
              p_id: 2,
              order_idx: 2
              record: {
                status: 'new'
                completed_count: 0
                total_count: 0
              }
            }
          ]
        }
      ]
    }
  }

  $scope.render = json_resp.render
  $scope.question_container = json_resp.question_container

  titleService.setTitle($scope.question_container.title)

  $scope.defaultSection = findInTreeNodes(
    $scope.question_container.question_sections,
    $scope.render.default_section_id
  )
)
