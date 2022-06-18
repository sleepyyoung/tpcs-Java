package tpcs.service;

import com.github.pagehelper.PageInfo;
import tpcs.pojo.Course;
import tpcs.pojo.Result;

import java.util.List;

public interface ICombineService {
    /** 获取id */
    List<Integer> queryIdListByTypeIdAndDifficultyIdAndScore(Integer courseId, Integer typeId, Integer difficultyId, Double score);

    List<Integer> queryIdListByTypeIdAndDifficultyId(Integer courseId, Integer typeId, Integer difficultyId);
}
