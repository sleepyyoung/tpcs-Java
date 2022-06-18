package tpcs.controller.api;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import tpcs.pojo.*;
import tpcs.service.ICombineService;
import tpcs.service.ICourseService;
import tpcs.service.IQuestionService;
import tpcs.util.CombineUtil;

import java.util.*;

@RequestMapping("/api/combine")
@RestController(value = "api-combine-controller")
public class CombineController {
    @Autowired
    private ICombineService combineService;
    @Autowired
    private IQuestionService questionService;
    @Autowired
    private ICourseService courseService;
    @Autowired
    private CombineUtil combineUtil;

    /** 组卷用的初始化数据 */
    @GetMapping("/init")
    public String combineInitData() {
        ArrayList<LinkedHashMap<String, Object>> list = new ArrayList<>();
        for (QuestionType type : questionService.questionTypeList()) {
            for (QuestionDifficulty difficulty : questionService.questionDifficultyList()) {
                LinkedHashMap<String, Object> map = new LinkedHashMap<>();
                map.put("type", type.getName());
                map.put("typeId", type.getId());
                map.put("difficulty", difficulty.getName());
                map.put("difficultyId", difficulty.getId());
                map.put("num", "");
                map.put("score", "");
                map.put("dScore", "");
                map.put("tScore", "");
                map.put("LAY_CHECKED", true);
                list.add(map);
            }
        }
        return JSON.toJSONString(new Result(0, "", list));
    }

    /** 更新组卷页面的表格数据 */
    @PostMapping("/update")
    public String updateCombineData(@RequestBody List<Map<String, Object>> tableDataList) {
        List<Map<String, Object>> list1 = new ArrayList<>();
        Map<Integer, Double> tScoreMap = new HashMap<>();
        for (Map<String, Object> map : tableDataList) {
            String numS = ((String) map.get("num")).trim();
            map.put("LAY_CHECKED", true);
            int typeId = (Integer) map.get("typeId");
            int num = "".equals(numS) ? 0 : Integer.parseInt(numS);
            String scoreS = ((String) map.get("score")).trim();
            double score = "".equals(scoreS) ? 0 : Double.parseDouble(scoreS);
            map.put("dScore", num * score);
            double dScore = (Double) map.get("dScore");
            if (!"".equals(numS) && !"".equals(scoreS)) {
                tScoreMap.put(typeId, dScore + tScoreMap.getOrDefault(typeId, 0D));
                map.put("tScore", tScoreMap.get(typeId));
            }
            list1.add(map);
        }
        List<Map<String, Object>> list2 = new ArrayList<>();
        for (Map<String, Object> map : list1) {
            map.put("LAY_CHECKED", true);
            map.put("typeId", map.get("typeId") == null ? "" : map.get("typeId"));
            map.put("score", map.get("score") == null ? "" : map.get("score"));
            map.put("scoreId", map.get("scoreId") == null ? "" : map.get("scoreId"));
            map.put("difficulty", map.get("difficulty") == null ? "" : map.get("difficulty"));
            map.put("difficultyId", map.get("difficultyId") == null ? "" : map.get("difficultyId"));
            map.put("num", map.get("num") == null ? "" : map.get("num"));
            map.put("dScore", map.get("dScore") == null ? "" : map.get("dScore"));
            if ((0.0 == (Double) map.get("dScore"))) {
                map.put("dScore", "");
            }
            map.put("tScore", tScoreMap.get((Integer) map.get("typeId")) == null ? "" : tScoreMap.get((Integer) map.get("typeId")));
            if ("0".equals("" + map.get("tScore"))) {
                map.put("tScore", "");
            }
            list2.add(map);
        }
        Map<String, Object> result = new HashMap<>();
        result.put("table", list2);
        result.put("sum", tScoreMap.values().stream().mapToDouble(x -> x).sum());
        return JSON.toJSONString(result);
    }

    /**
     * 手动组卷
     * <br/> 自动组卷为特殊的手动组卷，参数在前端传入
     */
    @PostMapping("/{courseId}")
    public CombineResult combine(@PathVariable Integer courseId,
                                 @RequestParam("paper-title") String paperTitle,
                                 @RequestBody List<Map<String, Object>> tableDataList) {
        List<QuestionType> questionTypeList = questionService.questionTypeList();
        Map<Integer, CombineUtil.CombineQuestion> combineQuestionMap = new TreeMap();
        for (QuestionType type : questionTypeList) {
            combineQuestionMap.put(type.getId(), null);
        }
        combineUtil.setCombineQuestionMap(combineQuestionMap);

        for (Map<String, Object> map : tableDataList) {
            if (!"".equals(map.get("score")) && !"".equals(map.get("num"))) {
                int typeId = Integer.parseInt(String.valueOf(map.get("typeId")));
                Integer difficultyId = Integer.valueOf(String.valueOf(map.get("difficultyId")));
                Double score = Double.valueOf(String.valueOf(map.get("score")));
                double tScore = Double.parseDouble(String.valueOf(map.get("tScore")));
                int num = Integer.parseInt(String.valueOf(map.get("num")));
                List<Integer> ids = combineService.queryIdListByTypeIdAndDifficultyIdAndScore(
                        courseId, typeId, difficultyId, score);
                Collections.shuffle(ids);
                try {
                    List<Integer> subList = ids.subList(0, num);
                    if (combineQuestionMap.containsKey(typeId)) {
                        CombineUtil.CombineQuestion combineQuestion = combineQuestionMap.get(typeId);
                        if (combineQuestion != null) {
                            List<Integer> questionIdList = combineQuestion.getQuestionIdList();
                            if (questionIdList == null) {
                                questionIdList = subList;
                            } else {
                                questionIdList.addAll(subList);
                            }
                            combineQuestionMap.put(typeId, new CombineUtil.CombineQuestion(questionIdList, score, tScore));
                        } else {
                            combineQuestionMap.put(typeId, new CombineUtil.CombineQuestion(subList, score, tScore));
                        }
                    }
                } catch (IndexOutOfBoundsException e) {
                    String courseName = courseService.queryById(courseId).getName();
                    String typeName = questionService.getQuestionTypeById(typeId).getName();
                    String difficultyName = questionService.getQuestionDifficultyById(difficultyId).getName();
                    return new CombineResult(
                            false,
                            "课程为[<span style=\"color: red;\">" + courseName + "</span>]、题型为[<span style=\"color: red;\">" + typeName + "</span>]、难度为[<span style=\"color: red;\">" + difficultyName + "</span>]、分值为[<span style=\"color: red;\">" + score + "</span>]的题目不足[<span style=\"color: red;\">" + num + "</span>]道",
                            "课程为[<span style=\"color: red;\">" + courseName + "</span>]、题型为[<span style=\"color: red;\">" + typeName + "</span>]、难度为[<span style=\"color: red;\">" + difficultyName + "</span>]、分值为[<span style=\"color: red;\">" + score + "</span>]的题目不足[<span style=\"color: red;\">" + num + "</span>]道"
                    );
                }
            }
        }
        return combineUtil.questionCombine(paperTitle);
    }

    /** 题库现存题型分值及数量 */
    @GetMapping("/existing/{id}")
    public String combineQuestionBankType(@PathVariable Integer id) {
        ArrayList<LinkedHashMap<String, Object>> list = new ArrayList<>();
        for (QuestionBankType type : questionService.questionBankTypeList(id)) {
            LinkedHashMap<String, Object> map = new LinkedHashMap<>();
            map.put("type", type.getType());
            map.put("difficulty", type.getDifficulty());
            map.put("score", String.valueOf(type.getScore()));
            map.put("num", String.valueOf(type.getNum()));
            list.add(map);
        }
        return JSON.toJSONString(new Result(0, "", list));
    }
}
