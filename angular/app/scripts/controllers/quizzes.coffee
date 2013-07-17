'use strict'

app = angular.module('chalkApp')

app.controller 'QuizzesIndexCtrl', ($scope) ->
  $scope.papers = [
    {
      title: "测试卷1",
      id: 1
    },
    {
      title: "测试卷2",
      id: 2
    }
  ]

app.controller 'QuizzesShowCtrl', ($scope) ->
  material_content = "The ethical judgments of the Supreme Court justices have become an important issue recently. The court cannot (1)  its legitimacy as guardian of the rule of law (2)  justices behave like politicians. Yet, in several instances, justices acted in ways that (3)  the court’s reputation for being independent and impartial.
Justice Antonin Scalia, for example, appeared at political events. That kind of activity makes it less likely that the court’s decisions will be (4) as impartial judgments. Part of the problem is that the justices are not (5)  by an ethics code. At the very least, the court should make itself (6)  to the code of conduct that (7) to the rest of the federal judiciary.
This and other similar cases (8) the question of whether there is still a (9) between the court and politics.
The framers of the Constitution envisioned law (10)  having authority apart from politics. They gave justices permanent positions (11) they would be free to (12) those in power and have no need to (13)  political support. Our legal system was designed to set law apart from politics precisely because they are so closely (14) .
Constitutional law is political because it results from choices rooted in fundamental social (15)  like liberty and property. When the court deals with social policy decisions, the law it (16)  is inescapably political-which is why decisions split along ideological lines are so easily (17)  as unjust.
The justices must (18)  doubts about the court’s legitimacy by making themselves (19)  to the code of conduct. That would make rulings more likely to be seen as separate from politics and, (20) , convincing as law."
  $scope.json_resp = {
    question_container: {
      title: "2012考研英语",
      type: "真题",
      description: "这份试卷只是用来测试demo",
      question_sections: [
        {
          id: 1,
          title: "Section I Use of English",
          duration: "125分钟",
          description: "Directions:<br/> Read the following text. Choose the best word(s) for each numbered blank and mark [A],[B], [C] or [D] on ANSWER SHEET 1. (10 points)",
          level: 1,
          p_id: null,
          order_idx: 1,
          children: [
            {
              id: 3,
              title: null,
              description: null,
              level: 2,
              p_id: 1,
              order_idx: 1
              question: {
                id: 1,
                level: 1,
                order_idx: 1,
                title: null,
                matched_title: null,
                description: null,
                material: material_content,
                options: null,
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
                    question_content: {
                      id: 1,
                      answer_type: "choice",
                      content: null,
                      answer: "B",
                      analysis: "第一句提到“最高法院法官的道德判断已经成为一个重要问题”；第二句进一步详细说明，“法院无法（     ）其作为法律条文维护者的合法性，（     ）法官的行为如政客一样”。四个选项中，只有B选项，maintain“维持”符合题意，意为“维持其作为法律条文维护者的合法性”。",
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
                    question_content: {
                      id: 2,
                      answer_type: "choice",
                      content: null,
                      answer: "A",
                      analysis: "空格后面说“法官的行为像政客们一样”，空格前面说“法院无法维持其作为法律条文维护者的合法性”，这其中的逻辑关系是如果“法官如政客”，那么“法院无法维持其合法性”，四个选项中只有A选项符合这一逻辑关系，所以选A。",
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
        }
        # {
          # id: 2,
          # title: "Section II Reading Comprehension",
          # description: null,
          # level: 1,
          # p_id: null,
          # order_idx: 2,
          # chidren: [{
            # id: 4
            # title: "Part A",
            # description: "Directions:<br/>Read the following four texts. Answer the questions below each text by choosing [A], [B], [C] or [D]. Mark your answers on ANSWER SHEET 1. (40 points)",
            # level: 2,
            # p_id: 2,
            # order_idx: 1
          # }]
        # }
      ]
    }
  }
