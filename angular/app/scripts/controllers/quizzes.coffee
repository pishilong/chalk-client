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

  material_content1 = "The ethical judgments of the Supreme Court justices have become an important issue recently. The court cannot (1)  its legitimacy as guardian of the rule of law (2)  justices behave like politicians. Yet, in several instances, justices acted in ways that (3)  the court’s reputation for being independent and impartial.
Justice Antonin Scalia, for example, appeared at political events. That kind of activity makes it less likely that the court’s decisions will be (4) as impartial judgments. Part of the problem is that the justices are not (5)  by an ethics code. At the very least, the court should make itself (6)  to the code of conduct that (7) to the rest of the federal judiciary.
This and other similar cases (8) the question of whether there is still a (9) between the court and politics.
The framers of the Constitution envisioned law (10)  having authority apart from politics. They gave justices permanent positions (11) they would be free to (12) those in power and have no need to (13)  political support. Our legal system was designed to set law apart from politics precisely because they are so closely (14) .
Constitutional law is political because it results from choices rooted in fundamental social (15)  like liberty and property. When the court deals with social policy decisions, the law it (16)  is inescapably political-which is why decisions split along ideological lines are so easily (17)  as unjust.
The justices must (18)  doubts about the court’s legitimacy by making themselves (19)  to the code of conduct. That would make rulings more likely to be seen as separate from politics and, (20) , convincing as law."
  material_content2 = "Come on –Everybody’s doing it. That whispered message, half invitation and half forcing, is what most of us think of when we hear the words peer pressure. It usually leads to no good-drinking, drugs and casual sex. But in her new book Join the Club, Tina Rosenberg contends that peer pressure can also be a positive force through what she calls the social cure, in which organizations and officials use the power of group dynamics to help individuals improve their lives and possibly the world.
Rosenberg, the recipient of a Pulitzer Prize, offers a host of example of the social cure in action: In South Carolina, a state-sponsored antismoking program called Rage Against the Haze sets out to make cigarettes uncool. In South Africa, an HIV-prevention initiative known as LoveLife recruits young people to promote safe sex among their peers.
The idea seems promising，and Rosenberg is a perceptive observer. Her critique of the lameness of many public-health campaigns is spot-on: they fail to mobilize peer pressure for healthy habits, and they demonstrate a seriously flawed understanding of psychology. ”Dare to be different, please don’t smoke!” pleads one billboard campaign aimed at reducing smoking among teenagers-teenagers, who desire nothing more than fitting in. Rosenberg argues convincingly that public-health advocates ought to take a page from advertisers, so skilled at applying peer pressure.
But on the general effectiveness of the social cure, Rosenberg is less persuasive. Join the Club is filled with too much irrelevant detail and not enough exploration of the social and biological factors that make peer pressure so powerful. The most glaring flaw of the social cure as it’s presented here is that it doesn’t work very well for very long. Rage Against the Haze failed once state funding was cut. Evidence that the Love Life program produces lasting changes is limited and mixed.
There’s no doubt that our peer groups exert enormous influence on our behavior. An emerging body of research shows that positive health habits-as well as negative ones-spread through networks of friends via social communication. This is a subtle form of peer pressure: we unconsciously imitate the behavior we see every day.
Far less certain, however, is how successfully experts and bureaucrats can select our peer groups and steer their activities in virtuous directions. It’s like the teacher who breaks up the troublemakers in the back row by pairing them with better-behaved classmates. The tactic never really works. And that’s the problem with a social cure engineered from the outside: in the real world, as in school, we insist on choosing our own friends."
  material_content3 = "A deal is a deal-except, apparently ,when Entergy is involved. The company, a major energy supplier in New England, provoked justified outrage in Vermont last week when it announced it was reneging on a longstanding commitment to abide by the strict nuclear regulations.
Instead, the company has done precisely what it had long promised it would not challenge the constitutionality of Vermont’s rules in the federal court, as part of a desperate effort to keep its Vermont Yankee nuclear power plant running. It’s a stunning move.
The conflict has been surfacing since 2002, when the corporation bought Vermont’s only nuclear power plant, an aging reactor in Vernon. As a condition of receiving state approval for the sale, the company agreed to seek permission from state regulators to operate past 2012. In 2006, the state went a step further, requiring that any extension of the plant’s license be subject to Vermont legislature’s approval. Then, too, the company went along.
Either Entergy never really intended to live by those commitments, or it simply didn’t foresee what would happen next. A string of accidents, including the partial collapse of a cooling tower in 2007 and the discovery of an underground pipe system leakage, raised serious questions about both Vermont Yankee’s safety and Entergy’s management– especially after the company made misleading statements about the pipe. Enraged by Entergy’s behavior, the Vermont Senate voted 26 to 4 last year against allowing an extension.
Now the company is suddenly claiming that the 2002 agreement is invalid because of the 2006 legislation, and that only the federal government has regulatory power over nuclear issues. The legal issues in the case are obscure: whereas the Supreme Court has ruled that states do have some regulatory authority over nuclear power, legal scholars say that Vermont case will offer a precedent-setting test of how far those powers extend. Certainly, there are valid concerns about the patchwork regulations that could result if every statesets its own rules. But had Entergy kept its word, that debate would be beside the point.
The company seems to have concluded that its reputation in Vermont is already so damaged that it has nothing left to lose by going to war with the state. But there should be consequences. Permission to run a nuclear plant is a publictrust. Entergy runs 11 other reactors in the United States, including Pilgrim Nuclear station in Plymouth. Pledging to run Pilgrim safely, the company has applied for federal permission to keep it open for another 20 years. But as the Nuclear Regulatory Commission (NRC) reviews the company’s application, it should keep in mind what promises from Entergy are worth."
  json_resp = {
    render: {
      default_section_id: 2,
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
              order_idx: 1,
              question_num: 1,
              question: {
                id: 1,
                level: 1,
                order_idx: 1,
                title: null,
                matched_title: null,
                description: null,
                material: material_content1,
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
                      question_num: 1,
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
                      question_num: 2,
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
        },
        {
          id: 2,
          title: "Section II Reading Comprehension",
          description: null,
          level: 1,
          p_id: null,
          order_idx: 2,
          children: [
            {
              id: 4
              title: "Part A",
              description: "Directions:<br/>Read the following four texts. Answer the questions below each text by choosing [A], [B], [C] or [D]. Mark your answers on ANSWER SHEET 1. (40 points)",
              level: 2,
              p_id: 2,
              order_idx: 1,
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
                    material: material_content2 ,
                    options: null,
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
                        question_content: {
                          id: 3,
                          question_num: 1,
                          answer_type: "choice",
                          content: "According to the first paragraph, peer pressure often emerges as",
                          answer: "D",
                          analysis: "由题干定位到第一段。第三句提到，同辈压力通常导致酗酒、吸毒和随意性行为，其中usually与题干中often对应，no good-drinking, drugs and casual sex与选项中undesirable behaviors对应，leads to与cause对应，所以选D。",
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
                        question_content: {
                          id: 4,
                          question_num: 2,
                          answer_type: "choice",
                          content: "Rosenberg holds that public advocates should",
                          answer: "B",
                          analysis: "由题干定位到第三段最后一句。第三段一开始，Rosenberg就批评公共健康运动没有很好地运用同辈压力；最后一句，Rosenberg有说服力地指出公共健康的倡导者应效仿广告商，熟练运用同辈压力。意思即，他们应该向广告商们学习，选B",
                          fallible_point: null,
                          option_a: "recruit professional advertisers",
                          option_b: "learn from advertisers’ experience",
                          option_c: "stay away from commercial advertisers",
                          option_d: "recognize the limitations of advertisements"
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
                    material: material_content3,
                    options: null
                  }
                }
              ]
            },
            {
              id: 7
              title: "Part B",
              description: "Directions:<br/>Read the following four texts. Answer the questions below each text by choosing [A], [B], [C] or [D]. Mark your answers on ANSWER SHEET 1. (40 points)",
              level: 2,
              p_id: 2,
              order_idx: 2
            }
          ]
        }
      ]
    }
  }

  $scope.render = json_resp.render
  $scope.question_container = json_resp.question_container

  $scope.defaultSection = findInTreeNodes(
    $scope.question_container.question_sections,
    $scope.render.default_section_id)
